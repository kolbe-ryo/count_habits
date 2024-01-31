import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterUsecase {
  CounterUsecase(this._ref);

  final Ref _ref;

  Future<void> fetchAll() async {
    final counters = await _ref.read(counterRepositoryProvider).fetchAll();
  }
}
