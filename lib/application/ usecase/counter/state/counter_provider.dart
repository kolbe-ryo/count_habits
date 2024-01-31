import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

final countersProvider = NotifierProvider<Counters, List<Counter>>(Counters.new);

class Counters extends Notifier<List<Counter>> {
  @override
  List<Counter> build() => [];

  // ignore: avoid_setters_without_getters
  set setCounters(List<Counter> counters) => state = counters;

  void setCounter(Counter counter) {
    final matchIndex = state.indexWhere((element) => element.id == counter.id);
    if (matchIndex == -1) {
      throw const AppException('予期せぬエラーが発生しました。');
    }
    state[matchIndex] = counter;
  }
}
