import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';

class RemoteCounterRepository implements CounterRepository {
  @override
  Future<Counter> checkIn(String id, {bool exception = false}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Counter>> create(String name, {bool exception = false}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Counter>> delete(String id, {bool exception = false}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Counter>> fetchAll({bool exception = false}) {
    throw UnimplementedError();
  }

  @override
  Future<Counter> update({required String id, required String name, bool exception = false}) {
    throw UnimplementedError();
  }
}
