import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/inflastructure/local/shared_preferences_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localCounterRepositoryProvider = Provider<CounterRepository>(
  (ref) => LocalCounterRepository(
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  ),
);

// TODO 全体的に文字列表記を止める
class LocalCounterRepository implements CounterRepository {
  LocalCounterRepository({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

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
    // if (sharedPreferences.database == null) {
    //   await sharedPreferences.openDb();
    // }
    // await sharedPreferences.database!.insert(
    //   _tableName,
    //   Counter.init(name: name).toJson(),
    // );
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
    // if (sharedPreferences.database == null) {
    //   await sharedPreferences.openDb();
    // }
    // final allData = await sharedPreferences.database!.rawQuery(
    //   'SELECT * FROM $_tableName',
    // );
    return [];
  }

  @override
  Future<Counter> update({required String id, required String name, bool exception = false}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
