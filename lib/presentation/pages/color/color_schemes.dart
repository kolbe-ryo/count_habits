import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/presentation/pages/color/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorSchemesProvider = Provider.autoDispose<List<ColorScheme>>((ref) {
  final colorId = ref.watch(appearanceStateProvider.select((value) => value.colorId));
  switch (colorId) {
    case 0:
      return [lightColorScheme0, darkColorScheme0];
    // TODO: パターンを増やすこと
    default:
      throw const AppException(AppExceptionEnum.unexpectedException);
  }
});

/// Themeを切り換えるためのProvider
///
/// デフォルトはThemeMode.systemが設定されている
/// Appearanceのstateをwatchしており、リポジトリの値を反映する
final themeModeProvider = Provider.autoDispose<ThemeMode>((ref) {
  return ref.watch(appearanceStateProvider.select((value) => value.themeMode));
});
