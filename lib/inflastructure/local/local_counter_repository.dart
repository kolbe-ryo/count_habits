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
  Future<List<Counter>> fetchAll({
    bool exception = false,
  }) async {
    try {
      if (exception) {
        throw const AppException(AppExceptionEnum.counterCreate);
      }
      final currentJsonList = _sharedPreferences.getStringList(keyCounter) ?? [];
      return currentJsonList
          .map(
            (counterJson) => Counter.fromJson(json.decode(counterJson) as Map<String, dynamic>),
          )
          .toList();
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterFetchAll);
    }
  }

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
      final craeteCounterJson = json.encode(Counter.init(name: name).toJson());
      await _sharedPreferences.setStringList(keyCounter, [...currentJsonList, craeteCounterJson]);
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
      if (exception) {
        throw const AppException(AppExceptionEnum.counterCreate);
      }
      final countersList = await fetchAll();
      // idと一致するcounterを削除する
      final deletedCountersList = countersList.where((element) => element.id != id).toList();
      // idが存在しない場合、長さが変わっていないはず
      if (countersList.length == deletedCountersList.length) {
        throw const AppException(AppExceptionEnum.counterDelete);
      }
      final deletedJsonList = deletedCountersList.map((e) => json.encode(e.toJson())).toList();
      await _sharedPreferences.setStringList(keyCounter, deletedJsonList);
      return fetchAll();
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterDelete);
    }
  }

  @override
  Future<Counter> update({
    required String id,
    required String name,
    bool exception = false,
  }) async {
    try {
      // RepositoryからCounterのリストを取得する
      final countersList = await fetchAll();

      // 永続化のためのCounterJsonのListを作成する
      Counter? updatedCounter;
      final updateCounterJsonList = countersList.map(
        (counter) {
          // update対象のidと一致したものだけnameを変更したcounterを返却する
          if (counter.id == id) {
            updatedCounter = counter.changeName(name);
            return json.encode(updatedCounter!.toJson());
          }
          return json.encode(counter.toJson());
        },
      ).toList();

      // 確実に存在するはずだが、なければエラーを投げる
      if (updatedCounter == null) {
        throw const AppException(AppExceptionEnum.counterUpdate);
      }

      // 永続化と更新後のカウンタ返却
      await _sharedPreferences.setStringList(keyCounter, updateCounterJsonList);
      return updatedCounter!;
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterUpdate);
    }
  }

  @override
  Future<Counter> checkIn(
    String id, {
    bool exception = false,
  }) async {
    try {
      if (exception) {
        throw const AppException(AppExceptionEnum.counterCheckIn);
      }
      Counter? checkInCounter;
      final countersList = await fetchAll();

      // 永続化のためのCounterJsonのListを作成する
      final checkInCounterJsonList = countersList.map(
        (counter) {
          // checkin対象のidと一致したものだけcheckinしたcounterを返却する
          if (counter.id == id) {
            checkInCounter = counter.checkIn;
            return json.encode(checkInCounter!.toJson());
          }
          return json.encode(counter.toJson());
        },
      ).toList();

      // 確実に存在するはずだが、なければエラーを投げる
      if (checkInCounter == null) {
        throw const AppException(AppExceptionEnum.counterCheckIn);
      }

      await _sharedPreferences.setStringList(keyCounter, checkInCounterJsonList);
      return checkInCounter!;
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.counterCheckIn);
    }
  }

  @visibleForTesting
  @override
  Future<void> deleteAll() async => _sharedPreferences.remove(keyCounter);
}
