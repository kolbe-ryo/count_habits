import 'package:count_habits/application/usecase/appearance/state/appearance_provider.dart';
import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/util/async_execute_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appearanceUsecaseProvider = Provider<AppearanceUsecase>(AppearanceUsecase.new);

class AppearanceUsecase with AsyncExecuteMixin {
  const AppearanceUsecase(this._ref);

  final Ref _ref;

  Future<Appearance> fetch() async {
    final appearance = await execute(
      action: () async => _ref.read(appearanceRepositoryProvider).fetch(),
    );
    _ref.invalidate(appearanceProvider);
    return appearance;
  }

  Future<void> update({
    int? colorId,
    ThemeMode? themeMode,
    int? fontFamilyId,
  }) async {
    await execute(
      action: () async => _ref.read(appearanceRepositoryProvider).update(
            colorId: colorId,
            fontFamilyId: fontFamilyId,
          ),
    );
    _ref.invalidate(appearanceProvider);
  }

  Future<void> reset() async {
    await execute(
      action: () async => _ref.read(appearanceRepositoryProvider).reset(),
    );
    _ref.invalidate(appearanceProvider);
  }
}
