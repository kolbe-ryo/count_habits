import 'package:count_habits/domain/counter/entity/counter.dart';

abstract class CounterRepository {
  Future<Counter> fetch();
}
