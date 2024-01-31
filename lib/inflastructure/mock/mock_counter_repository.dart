import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';

class MockCounterRepository implements CounterRepository {
  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Counter>> fetchAll() {
    // TODO: implement fetchAll
    throw UnimplementedError();
  }

  @override
  Future<Counter> update({required int id, required String name}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
