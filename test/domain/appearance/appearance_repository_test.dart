import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/inflastructure/mock/mock_appearance_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';

void main() {
  final mockAppearanceRepository = MockAppearanceRepository();
  final providerContainer = ProviderContainer(
    overrides: [
      appearanceRepositoryProvider.overrideWithValue(mockAppearanceRepository),
    ],
  );

  group('fetchテスト', () {
    test('取得に成功した場合、任意のAppearanceクラスを取得可能なこと', () async {
      final appearance = await providerContainer.read(appearanceRepositoryProvider).fetch();
      expect(appearance, isA<Appearance>());
    });
    test('取得に失敗した場合、AppExceptionがthrowされること', () async {
      expect(
        () async {
          await providerContainer.read(appearanceRepositoryProvider).fetch(exception: true);
        },
        throwsA(isA<AppException>()),
      );
    });
  });
  group('updateテスト', () {
    test('任意のcolorId/ fontFamily更新に成功した場合、それぞれ変更された値のAppearanceクラスを取得可能なこと', () async {
      // 取得
      final repo = providerContainer.read(appearanceRepositoryProvider);
      final appearance = await repo.fetch();
      expect(appearance.colorId, 0);
      expect(appearance.fontFamilyId, 0);

      // 更新
      const colorId = 1;
      const fontFamilyId = 1;
      final appearanceUpdated = await repo.update(
        colorId: colorId,
        fontFamilyId: fontFamilyId,
      );
      expect(appearanceUpdated.colorId, 1);
      expect(appearanceUpdated.fontFamilyId, fontFamilyId);
    });
    test('更新に失敗した場合、AppExceptionがthrowされること', () async {
      expect(
        () async {
          await providerContainer.read(appearanceRepositoryProvider).fetch(exception: true);
        },
        throwsA(isA<AppException>()),
      );
    });
  });
  group('resetテスト', () {
    test('リセットに成功した場合、任意のAppearanceクラスを取得可能なこと', () async {
      await providerContainer.read(appearanceRepositoryProvider).reset();
      expect(mockAppearanceRepository.appearance, const Appearance());
    });
    test('リセットに失敗した場合、AppExceptionがthrowされること', () async {
      expect(
        () async {
          await providerContainer.read(appearanceRepositoryProvider).reset(exception: true);
        },
        throwsA(isA<AppException>()),
      );
    });
  });
}
