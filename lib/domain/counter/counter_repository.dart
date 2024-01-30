import 'package:count_habits/domain/counter/entity/counter.dart';

abstract interface class CounterRepository {
  Future<List<Counter>> fetchAll();

  Future<Counter> update({
    required int id,
    String? name,
  });

  Future<void> delete(int id);
}
