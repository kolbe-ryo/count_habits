import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.g.dart';
import 'package:count_habits/presentation/pages/theme/text_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cupertinoThemeProvider = Provider.autoDispose<CupertinoThemeData>((ref) {
  final colorId = ref.watch(appearanceStateProvider.select((value) => value.colorId));
  final fontFamilyId = ref.watch(appearanceStateProvider.select((value) => value.fontFamilyId));
  if (colorSchemes[colorId] == null || textSchemes[fontFamilyId] == null) {
    throw const AppException(AppExceptionEnum.unexpectedException);
  }
  return colorSchemes[colorId]!.copyWith(
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(
        fontFamily: textSchemes[fontFamilyId],
      ),
    ),
  );
});
