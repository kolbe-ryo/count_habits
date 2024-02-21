import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/presentation/pages/color/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorSchemesProvider = Provider.autoDispose<List<ColorScheme>>((ref) {
  final colorId = ref.watch<int>(appearanceStateProvider.select((value) => value.colorId));
  switch (colorId) {
    case 0:
      return [lightColorScheme0, darkColorScheme0];
    // TODO: パターンを増やすこと
    default:
      throw const AppException(AppExceptionEnum.unexpectedException);
  }
});

// TODO: 切り替え可能なこと
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
