import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/inflastructure/mock/mock_counter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';

void main() {
  final mockCounterRepository = MockCounterRepository();
  final providerContainer = ProviderContainer(
    overrides: [
      counterRepositoryProvider.overrideWithValue(mockCounterRepository),
    ],
  );

  group('fetchAllテスト', () {
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
    test('更新に成功した場合、引数で与えた任意のnameが設定されていること', () {});
    test('更新に失敗した場合、AppExceptionがthrowされること', () {});
  });

  group('deleteテスト', () {
    test('削除に成功した場合、指定したidのCounterが削除されていること', () {});
    test('存在しないはずだが、Counterが存在しない状態で削除した場合、空の配列が返却されること', () {});
    test('インフラで更新に失敗した場合、AppExceptionがthrowされること', () {});
    test('id不一致で更新に失敗した場合、AppExceptionがthrowされること', () {});
  });

  group('checkInテスト', () {
    test('カウントアップに成功した場合、CounterValueは+1、Contributionは+1要素されていること', () {});
    test('更新に失敗した場合、AppExceptionがthrowされること', () {});
  });
}
