import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appearanceProvider = Provider<AppearanceUsecase>(AppearanceUsecase.new);

class AppearanceUsecase {
  const AppearanceUsecase(this._ref);

  final Ref _ref;

  Future<void> fetch() async {
    final currentAppearance = await _ref.read(appearanceRepositoryProvider).fetch();
    _ref.read(appearanceStateProvider.notifier).setAppearance = currentAppearance;
  }

  Future<void> update({
    int? colorid,
    ThemeMode? themeMode,
    String? fontFamily,
  }) async {
    final updatedAppearance = await _ref.read(appearanceRepositoryProvider).update(
          colorId: colorid,
          themeMode: themeMode,
          fontFamily: fontFamily,
        );
    _ref.read(appearanceStateProvider.notifier).setAppearance = updatedAppearance;
  }

  Future<void> reset() async {
    await _ref.read(appearanceRepositoryProvider).reset();
    _ref.read(appearanceStateProvider.notifier).setAppearance = const Appearance();
  }
}
