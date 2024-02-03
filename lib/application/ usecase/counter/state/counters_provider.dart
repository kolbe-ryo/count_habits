import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counters_provider.g.dart';

@riverpod
class Counters extends _$Counters {
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
