import 'dart:convert';

import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/inflastructure/local/shared_preferences_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAppearanceRepository implements AppearanceRepository {
  LocalAppearanceRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @visibleForTesting
  Appearance? get appearance {
    final currentAppearanceJson = _sharedPreferences.getString(keyAppearance);
    if (currentAppearanceJson == null) {
      return null;
    }
    return Appearance.fromJson(json.decode(currentAppearanceJson) as Map<String, dynamic>);
  }

  @override
  Future<void> create({bool exception = false}) async {
    try {
      // ローカルに作成済みの場合は何もしない
      if (_sharedPreferences.getString(keyAppearance) != null) {
        return;
      }
      // ローカルにAppearanceの設定を保存する
      final initialAppearance = json.encode(const Appearance().toJson());
      await _sharedPreferences.setString(keyAppearance, initialAppearance);
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.appearanceCreate);
    }
  }

  @override
  Future<Appearance> fetch({bool exception = false}) async {
    try {
      var currentAppearanceJson = _sharedPreferences.getString(keyAppearance);
      if (exception) {
        throw const AppException(AppExceptionEnum.appearanceFetch);
      }

      // Apperanceが存在しない場合作成する
      if (currentAppearanceJson == null) {
        await create();
        currentAppearanceJson = _sharedPreferences.getString(keyAppearance);
      }

      return Appearance.fromJson(json.decode(currentAppearanceJson!) as Map<String, dynamic>);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> reset({bool exception = false}) async {
    try {
      final initialAppearance = json.encode(const Appearance().toJson());
      await _sharedPreferences.setString(keyAppearance, initialAppearance);
      if (exception) {
        throw const AppException(AppExceptionEnum.appearanceReset);
      }
    } on Exception catch (_) {
      throw const AppException(AppExceptionEnum.appearanceReset);
    }
  }

  @override
  Future<Appearance> update({
    int? colorId,
    int? fontFamilyId,
    bool exception = false,
  }) async {
    try {
      final currentAppearanceJson = _sharedPreferences.getString(keyAppearance);
      if (currentAppearanceJson == null || exception) {
        throw const AppException(AppExceptionEnum.appearanceUpdate);
      }
      final currentAppearance = Appearance.fromJson(json.decode(currentAppearanceJson) as Map<String, dynamic>);
      final updateAppearance = currentAppearance.copyWith(
        colorId: colorId ?? currentAppearance.colorId,
        fontFamilyId: fontFamilyId ?? currentAppearance.fontFamilyId,
      );
      await _sharedPreferences.setString(keyAppearance, json.encode(updateAppearance.toJson()));
      return updateAppearance;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
