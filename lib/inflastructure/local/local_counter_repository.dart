import 'dart:convert';

import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/inflastructure/local/shared_preferences_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localCounterRepositoryProvider = Provider<CounterRepository>(
  (ref) => LocalCounterRepository(
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  ),
);

class LocalCounterRepository implements CounterRepository {
  LocalCounterRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

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
    try {
      final counterJson = Counter.init(name: name).toJson().toString();
      await _sharedPreferences.setString(keyCounter, counterJson);
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterCreate);
    }
    return fetchAll();
  }

  @override
  Future<List<Counter>> delete(
    String id, {
    bool exception = false,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Counter>> fetchAll({
    bool exception = false,
  }) async {
    // TODO: implement fetchAll
    // if (sharedPreferences.database == null) {
    //   await sharedPreferences.openDb();
    // }
    // final allData = await sharedPreferences.database!.rawQuery(
    //   'SELECT * FROM $_tableName',
    // );
    return [];
  }

  @override
  Future<Counter> update({
    required String id,
    required String name,
    bool exception = false,
  }) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
