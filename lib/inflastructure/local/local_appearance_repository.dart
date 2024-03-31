import 'dart:convert';

import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/inflastructure/local/shared_preferences_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localAppearanceRepositoryProvider = Provider<AppearanceRepository>(
  (ref) => LocalAppearanceRepository(
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  ),
);

class LocalAppearanceRepository implements AppearanceRepository {
  LocalAppearanceRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> create({bool exception = false}) async {
    try {
      // ローカルに作成済みの場合は何もしない
      if (_sharedPreferences.getString(keyAppearance) != null) {
        return;
      }
      // ローカルにAppearanceの設定を保存する
      final initialAppearance = const Appearance().toJson().toString();
      await _sharedPreferences.setString(keyAppearance, initialAppearance);
    } on AppException catch (_) {
      throw const AppException(AppExceptionEnum.appearanceCreate);
    }
  }

  @override
  Future<Appearance> fetch({bool exception = false}) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> reset({bool exception = false}) async {
    try {
      final initialAppearance = const Appearance().toJson().toString();
      await _sharedPreferences.setString(keyAppearance, initialAppearance);
    } on AppException catch (_) {
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
      if (currentAppearanceJson == null) {
        throw const AppException(AppExceptionEnum.appearanceUpdate);
      }
      final currentAppearance = Appearance.fromJson(json.decode(currentAppearanceJson) as Map<String, dynamic>);
      final updateAppearance = currentAppearance.copyWith(
        colorId: colorId ?? currentAppearance.colorId,
        fontFamilyId: fontFamilyId ?? currentAppearance.fontFamilyId,
      );
      await _sharedPreferences.setString(keyAppearance, updateAppearance.toJson().toString());
      return updateAppearance;
    } on AppException catch (_) {
      throw const AppException(AppExceptionEnum.appearanceUpdate);
    }
  }
}
