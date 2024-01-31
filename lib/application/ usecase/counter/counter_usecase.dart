import 'package:count_habits/application/%20usecase/counter/state/counter_provider.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterUsecaseProvider = Provider<CounterUsecase>(CounterUsecase.new);

class CounterUsecase {
  CounterUsecase(this._ref);

  final Ref _ref;

  Future<void> fetchAll() async {
    final counters = await _ref.read(counterRepositoryProvider).fetchAll();
    _ref.read(countersProvider.notifier).setCounters = counters;
  }

  Future<void> update({
    required int id,
    required String name,
  }) async {
    final counter = await _ref.read(counterRepositoryProvider).update(
          id: id,
          name: name,
        );
    _ref.read(countersProvider.notifier).setCounter(counter);
  }

  Future<void> delete(int id) async {
    await _ref.read(counterRepositoryProvider).delete(id);
  }
}
