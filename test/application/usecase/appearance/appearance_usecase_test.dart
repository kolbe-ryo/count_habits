import 'package:count_habits/application/%20usecase/appearance/appearance_usecase.dart';
import 'package:count_habits/application/%20usecase/appearance/state/appearance_state_provider.dart';
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
      await providerContariner.read(appearanceProvider).fetch();
      final state = providerContariner.read(appearanceStateProvider);
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
      await providerContariner.read(appearanceProvider).update(
            colorid: 1,
            fontFamily: 'Hachi_Maru_Pop',
          );
    });
  });

  group('resetテスト', () {
    final mockAppearanceRepository = MockAppearanceRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        appearanceRepositoryProvider.overrideWithValue(mockAppearanceRepository),
      ],
    );
    test('', () async {});
  });
}
