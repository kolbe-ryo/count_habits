import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countersProvider = NotifierProvider<Counters, List<Counter>>(Counters.new);

class Counters extends Notifier<List<Counter>> {
  @override
  List<Counter> build() => [];

  // ignore: avoid_setters_without_getters
  set setState(List<Counter> counters) => state = counters;
}
