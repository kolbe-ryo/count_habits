import 'package:count_habits/application/usecase/appearance/appearance_usecase.dart';
import 'package:count_habits/application/usecase/appearance/state/appearance_provider.dart';
import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/inflastructure/mock/mock_appearance_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';

void main() {
  group('fetchテスト', () {
    final mockAppearanceRepository = MockAppearanceRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        appearanceRepositoryProvider.overrideWithValue(mockAppearanceRepository),
      ],
    );
    test('取得したAppearanceがstateに格納されていること', () async {
      await providerContariner.read(appearanceUsecaseProvider).fetch();
      final state = providerContariner.read(appearanceProvider);
      expect(state, const Appearance());
    });
  });

  group('updateテスト', () {
    final mockAppearanceRepository = MockAppearanceRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        appearanceRepositoryProvider.overrideWithValue(mockAppearanceRepository),
      ],
    );
    test('更新したAppearanceがstateに格納されていること', () async {
      const matcherState = Appearance(
        colorId: 1,
        fontFamilyId: 1,
      );
      await providerContariner.read(appearanceUsecaseProvider).update(
            colorId: matcherState.colorId,
            fontFamilyId: matcherState.fontFamilyId,
          );
      final state = await providerContariner.read(appearanceProvider.future);
      expect(state, matcherState);
    });
  });

  group('resetテスト', () {
    final mockAppearanceRepository = MockAppearanceRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        appearanceRepositoryProvider.overrideWithValue(mockAppearanceRepository),
      ],
    );
    test('初期値ではないstateをリセットすると初期値に設定されること', () async {
      const matcherState = Appearance(
        colorId: 1,
        fontFamilyId: 1,
      );
      await providerContariner.read(appearanceUsecaseProvider).update(
            colorId: matcherState.colorId,
            fontFamilyId: matcherState.fontFamilyId,
          );
      var state = await providerContariner.read(appearanceProvider.future);
      expect(state, matcherState);

      await providerContariner.read(appearanceUsecaseProvider).reset();
      state = await providerContariner.read(appearanceProvider.future);
      expect(state, const Appearance());
    });
  });
}
