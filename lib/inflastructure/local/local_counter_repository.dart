import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/inflastructure/local/sqflite_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final localCounterRepositoryProvider = Provider<CounterRepository>(
  (ref) => LocalCounterRepository(
    sqfliteClient: ref.watch(sqfliteClientProvider),
  ),
);

class LocalCounterRepository implements CounterRepository {
  LocalCounterRepository({required this.sqfliteClient});

  final SqfliteClient sqfliteClient;

  @override
  Future<Counter> checkIn(String id, {bool exception = false}) {
    // TODO: implement checkIn
    throw UnimplementedError();
  }

  @override
  Future<List<Counter>> create(
    String name, {
    bool exception = false,
  }) async {
    if (sqfliteClient.database == null) {
      await sqfliteClient.openDb();
    }
    await sqfliteClient.database!.insert(
      'counters',
      Counter.init(name: name).toJson(),
    );
    return fetchAll();
  }

  @override
  Future<List<Counter>> delete(String id, {bool exception = false}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Counter>> fetchAll({
    bool exception = false,
  }) async {
    if (sqfliteClient.database == null) {
      await sqfliteClient.openDb();
    }
    final allData = await sqfliteClient.database!.query('counters');
    return allData.map(Counter.fromJson).toList();
  }

  @override
  Future<Counter> update({required String id, required String name, bool exception = false}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
