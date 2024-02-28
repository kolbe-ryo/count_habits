import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/presentation/pages/color/color_schemes.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cupertinoThemeProvider = Provider.autoDispose<CupertinoThemeData>((ref) {
  final colorId = ref.watch(appearanceStateProvider.select((value) => value.colorId));
  if (colorMap[colorId] == null) {
    throw const AppException(AppExceptionEnum.unexpectedException);
  }
  return colorMap[colorId]!;
});
