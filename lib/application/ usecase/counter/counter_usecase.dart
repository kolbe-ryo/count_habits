import 'package:count_habits/application/%20usecase/counter/state/counters_provider.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterUsecaseProvider = Provider<CounterUsecase>(CounterUsecase.new);

class CounterUsecase {
  const CounterUsecase(this._ref);

  final Ref _ref;

  Future<void> fetchAll() async {
    final counters = await _ref.read(counterRepositoryProvider).fetchAll();
    _ref.read(countersProvider.notifier).setCounters = counters;
  }

  Future<void> update({
    required String id,
    required String name,
  }) async {
    final counter = await _ref.read(counterRepositoryProvider).update(
          id: id,
          name: name,
        );
    _ref.read(countersProvider.notifier).setCounter(counter);
  }

  Future<void> delete(String id) async {
    await _ref.read(counterRepositoryProvider).delete(id);
  }

  Future<void> countUp(String id) async {
    // Update Repo
    // カウントの反映を優先したいので、非同期にして保存失敗した場合は例外をthrowしてstateをRepoの状態に合わせる
    // TODO 上記の処理
    try {
      await _ref.read(counterRepositoryProvider).checkIn(id);
    } on AppException catch (e, trace) {
      // TODO loggerの実装
      // print('$e, $trace');
    }

    // Count up and add datetime element in the last
    final counterCheckedIn = _ref.read(countersProvider.notifier).getCounter(id).checkIn;
    _ref.read(countersProvider.notifier).setCounter(counterCheckedIn);
  }
}
