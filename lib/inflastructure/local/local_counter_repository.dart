import 'dart:convert';

import 'package:collection/collection.dart';
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
  }) async {
    try {
      // RepositoryからCounterのリストを取得する（Jsonをdecodeする）
      final countersList = _sharedPreferences
              .getStringList(keyCounter)
              ?.map(
                (element) => Counter.fromJson(json.decode(element) as Map<String, dynamic>),
              )
              .toList() ??
          [];

      // 目的のIDのCounterが存在することを確認する
      final updatedCounter = countersList.firstWhereOrNull((element) => element.id == id);
      if (updatedCounter == null) {
        throw const AppException(AppExceptionEnum.counterUpdate);
      }

      // 永続化のためのCounterJsonのListを作成する
      final updateCounterJsonList = countersList.map(
        (counter) {
          // update対象のidと一致したものだけnameを変更したcounterを返却する
          if (counter.id == id) {
            final updatedCounterValue = counter.counterValue.copyWith(name: name);
            return counter.copyWith(counterValue: updatedCounterValue).toJson().toString();
          }
          return counter.toJson().toString();
        },
      ).toList();

      // 永続化と更新後のカウンタ返却
      await _sharedPreferences.setStringList(keyCounter, updateCounterJsonList);
      return updatedCounter;
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterUpdate);
    }
  }

  @override
  Future<Counter> checkIn(String id, {bool exception = false}) {
    // TODO: implement checkIn
    throw UnimplementedError();
  }
}
