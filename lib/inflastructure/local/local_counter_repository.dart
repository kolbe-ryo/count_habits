import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/inflastructure/local/shared_preferences_client.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      if (exception) {
        throw const AppException(AppExceptionEnum.counterCreate);
      }
      final currentJsonList = _sharedPreferences.getStringList(keyCounter) ?? [];
      final counterJson = json.encode(Counter.init(name: name).toJson());
      await _sharedPreferences.setStringList(keyCounter, [...currentJsonList, counterJson]);
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterCreate);
    }
    return fetchAll();
  }

  // TODO: 修正する（これだとdleteAllと同じ挙動）
  @override
  Future<List<Counter>> delete(
    String id, {
    bool exception = false,
  }) async {
    try {
      if (exception) {
        throw const AppException(AppExceptionEnum.counterCreate);
      }
      final countersList = await fetchAll();
      countersList.removeWhere((element) => element.id == id);
      final deletedJsonList = countersList.map((e) => json.encode(e.toJson())).toList();
      await _sharedPreferences.setStringList(keyCounter, deletedJsonList);
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
      if (exception) {
        throw const AppException(AppExceptionEnum.counterCreate);
      }
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
      final countersList = await fetchAll();
      // 目的のIDのCounterが存在することを確認する
      final updateCounter = countersList.firstWhereOrNull((element) => element.id == id);
      if (updateCounter == null || exception) {
        throw const AppException(AppExceptionEnum.counterUpdate);
      }

      // 永続化のためのCounterJsonのListを作成する
      Counter? updatedCounter;
      final updateCounterJsonList = countersList.map(
        (counter) {
          // update対象のidと一致したものだけnameを変更したcounterを返却する
          if (counter.id == id) {
            final updatedCounterValue = counter.counterValue.copyWith(name: name);
            updatedCounter = counter.copyWith(counterValue: updatedCounterValue);
            return json.encode(updatedCounter!.toJson());
          }
          return json.encode(counter.toJson());
        },
      ).toList();

      // 永続化と更新後のカウンタ返却
      await _sharedPreferences.setStringList(keyCounter, updateCounterJsonList);
      if (updatedCounter == null) {
        throw const AppException(AppExceptionEnum.counterUpdate);
      }
      return updatedCounter!;
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterUpdate);
    }
  }

  @override
  Future<Counter> checkIn(String id, {bool exception = false}) async {
    try {
      if (exception) {
        throw const AppException(AppExceptionEnum.counterCreate);
      }
      final countersList = await fetchAll();
      // 永続化のためのCounterJsonのListを作成する
      final checkInCounterJsonList = countersList.map(
        (counter) {
          // checkin対象のidと一致したものだけcheckinしたcounterを返却する
          if (counter.id == id) {
            return json.encode(counter.checkIn.toJson());
          }
          return json.encode(counter.toJson());
        },
      ).toList();
      await _sharedPreferences.setStringList(keyCounter, checkInCounterJsonList);
      return countersList.firstWhere((element) => element.id == id);
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterCheckIn);
    }
  }

  @visibleForTesting
  Future<void> deleteAll() async {
    await _sharedPreferences.remove(keyCounter);
  }
}
