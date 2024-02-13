import 'package:collection/collection.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
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
    state[matchIndex] = counter;
  }

  void deleteCounter(Counter counter) {
    final matchIndex = state.indexWhere((element) => element.id == counter.id);
    state = [...state]..removeAt(matchIndex);
  }

  Counter getCounter(String id) {
    final counter = state.firstWhereOrNull((element) => element.id == id);
    if (counter == null) {
      throw const AppException(AppExceptionEnum.unexpectedException);
    }
    return counter;
  }
}
