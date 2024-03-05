import 'package:count_habits/application/state/app_loading_state_provider.dart';
import 'package:count_habits/application/usecase/counter/state/counters_provider.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/util/async_execute_mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterUsecaseProvider = Provider<CounterUsecase>(CounterUsecase.new);

class CounterUsecase with AsyncExecuteMixin {
  const CounterUsecase(this._ref);

  final Ref _ref;

  Future<void> create({
    required String name,
  }) async {
    await execute(
      appLoadingState: _ref.read(appLoadingStateProvider.notifier),
      action: () async {
        await _ref.read(counterRepositoryProvider).create(name);
      },
    );
    _ref.invalidate(countersProvider);
  }

  Future<List<Counter>> fetchAll() async {
    final counters = await execute<List<Counter>>(
      appLoadingState: _ref.read(appLoadingStateProvider.notifier),
      action: _ref.read(counterRepositoryProvider).fetchAll,
    );
    return counters;
  }

  Future<void> update({
    required String id,
    required String name,
  }) async {
    await execute(
      appLoadingState: _ref.read(appLoadingStateProvider.notifier),
      action: () async {
        await _ref.read(counterRepositoryProvider).update(
              id: id,
              name: name,
            );
      },
    );
    _ref.invalidate(countersProvider);
  }

  Future<void> delete(String id) async {
    await execute(
      appLoadingState: _ref.read(appLoadingStateProvider.notifier),
      action: () async => _ref.read(counterRepositoryProvider).delete(id),
    );
    _ref.invalidate(countersProvider);
  }

  Future<void> countUp(String id) async {
    await execute(
      appLoadingState: null,
      action: () async => _ref.read(counterRepositoryProvider).checkIn(id),
    );
    _ref.invalidate(countersProvider);
  }
}
