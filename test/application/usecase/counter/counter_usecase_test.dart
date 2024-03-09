// import 'dart:ffi';

import 'package:count_habits/application/usecase/counter/counter_usecase.dart';
import 'package:count_habits/application/usecase/counter/state/counters_provider.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/inflastructure/mock/mock_counter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';

void main() {
  group('createテスト', () {
    late ProviderContainer providerContariner;
    final mockCounterRepository = MockCounterRepository();

    setUp(() {
      providerContariner = ProviderContainer(
        overrides: [
          counterRepositoryProvider.overrideWithValue(mockCounterRepository),
        ],
      );
    });

    test('任意のnameを渡してcreateをコールするとinitCounterValueがstateに反映されること', () async {
      const name = 'create';
      final initCountersLength = mockCounterRepository.counters.length;
      await providerContariner.read(counterUsecaseProvider).create(name: name);

      expect(mockCounterRepository.counters.length, initCountersLength + 1);

      // counter stateから値を取得する
      final counters = await providerContariner.read(countersProvider.future);

      expect(counters, mockCounterRepository.counters);
    });
  });

  group('fetchAllテスト', () {
    late ProviderContainer providerContariner;
    final mockCounterRepository = MockCounterRepository();

    setUp(() {
      providerContariner = ProviderContainer(
        overrides: [
          counterRepositoryProvider.overrideWithValue(mockCounterRepository),
        ],
      );
    });

    test('すべてのCounterが取得可能なこと', () async {
      await providerContariner.read(counterUsecaseProvider).fetchAll();
      final counters = await providerContariner.read(countersProvider.future);
      expect(counters.length, 3);
    });
  });

  // TODO テストの続きを書く
  group('updateテスト', () {
    // final mockCounterRepository = MockCounterRepository();
    // final providerContariner = ProviderContainer(
    //   overrides: [
    //     counterRepositoryProvider.overrideWithValue(mockCounterRepository),
    //   ],
    //   // プロバイダを監視して変化を検出する（ここでlitenしないと、autoDisposeの対象になってしまい、fetchAllとupdate後は破棄されるため、stateを共有できない）
    // )..listen<List<Counter>>(
    //     countersProvider,
    //     (_, __) => logger.i('listen'),
    //   );

    late ProviderContainer providerContariner;
    final mockCounterRepository = MockCounterRepository();

    setUp(() {
      providerContariner = ProviderContainer(
        overrides: [
          counterRepositoryProvider.overrideWithValue(mockCounterRepository),
        ],
      );
    });

    test('存在する任意のidに対して任意のnameを渡すとnameが更新されること', () async {
      const id = '0';
      const name = 'update';
      // 初期値は0のはず
      var counters = await providerContariner.read(countersProvider.future);
      expect(counters[int.parse(id)].counterValue.name, 'number 0');

      await providerContariner.read(counterUsecaseProvider).update(
            id: id,
            name: name,
          );

      counters = await providerContariner.read(countersProvider.future);
      expect(counters[int.parse(id)].counterValue.name, name);

      // このようにすることで登録したlistenerを削除できる（ただし、autoDisposeはされなくなる）
      // providerContariner
      //     .listen<List<Counter>>(
      //       countersProvider,
      //       (previous, next) => logger.i('listen'),
      //     )
      //     .close();
    });
  });

  group('deleteテスト', () {
    late ProviderContainer providerContariner;
    final mockCounterRepository = MockCounterRepository();

    setUp(() {
      providerContariner = ProviderContainer(
        overrides: [
          counterRepositoryProvider.overrideWithValue(mockCounterRepository),
        ],
      );
    });

    test('任意のCounterを指定すると指定したCounterがstateから削除されていること', () async {
      const id = '0';
      final initialCountersLength = mockCounterRepository.counters.length;

      await providerContariner.read(counterUsecaseProvider).delete(id);

      final counters = await providerContariner.read(countersProvider.future);
      expect(counters.length, initialCountersLength - 1);
    });
  });

  group('counteUpテスト', () {
    late ProviderContainer providerContariner;
    final mockCounterRepository = MockCounterRepository();

    setUp(() {
      providerContariner = ProviderContainer(
        overrides: [
          counterRepositoryProvider.overrideWithValue(mockCounterRepository),
        ],
      );
    });

    test('任意のidを指定すると指定したCounterがCounterValue+1で返却されること（0=>1）', () async {
      const id = '0';

      // 初期値は0のはず
      var counters = await providerContariner.read(countersProvider.future);
      expect(counters[int.parse(id)].counterValue.count, 0);

      await providerContariner.read(counterUsecaseProvider).countUp(id);

      counters = await providerContariner.read(countersProvider.future);
      expect(counters[int.parse(id)].counterValue.count, 1);
    });
  });
}
