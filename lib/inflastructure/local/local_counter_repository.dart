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
  Future<List<Counter>> create(
    String name, {
    bool exception = false,
  }) async {
    try {
      final currentJsonList = _sharedPreferences.getStringList(keyCounter) ?? [];
      final counterJson = Counter.init(name: name).toJson().toString();
      await _sharedPreferences.setStringList(keyCounter, [...currentJsonList, counterJson]);
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterCreate);
    }
    return fetchAll();
  }

  @override
  Future<List<Counter>> delete(
    String id, {
    bool exception = false,
  }) async {
    try {
      await _sharedPreferences.remove(keyCounter);
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterDelete);
    }
    return fetchAll();
  }

  @override
  Future<List<Counter>> fetchAll({
    bool exception = false,
  }) async {
    try {
      final currentJsonList = _sharedPreferences.getStringList(keyCounter) ?? [];
      if (currentJsonList.isEmpty) {
        return [];
      }
      return currentJsonList
          .map(
            (e) => Counter.fromJson(json.decode(e) as Map<String, dynamic>),
          )
          .toList();
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterFetchAll);
    }
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

  @override
  Future<Counter> checkIn(String id, {bool exception = false}) {
    // TODO: implement checkIn
    throw UnimplementedError();
  }
}
