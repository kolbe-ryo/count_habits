import 'package:count_habits/application/%20usecase/counter/counter_usecase.dart';
import 'package:count_habits/application/%20usecase/counter/state/counters_provider.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/inflastructure/mock/mock_counter_repository.dart';
import 'package:count_habits/util/constants/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';

void main() {
  group('createテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    test('任意のnameを渡してcreateをコールするとinitCounterValueがstateに反映されること', () async {
      const name = 'create';
      final initCounter = Counter.init(name: name);
      await providerContariner.read(counterUsecaseProvider).create(name: name);
      final state = providerContariner.read(countersProvider).firstWhere(
            (element) => element.counterValue.name == name,
          );
      expect(state.counterValue, initCounter.counterValue);
    });
  });

  group('fetchAllテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    test('すべてのCounterが取得可能なこと', () async {
      await providerContariner.read(counterUsecaseProvider).fetchAll();
      final state = providerContariner.read(countersProvider);

      expect(state.length, 3);
    });
  });

  group('updateテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
      // プロバイダを監視して変化を検出する（ここでlitenしないとfetchAllとupdateでstateを共有できない）
    )..listen<List<Counter>>(
        countersProvider,
        (_, __) => logger.i('listen'),
      );

    test('存在する任意のidに対して任意のnameを渡すとnameが更新されること', () async {
      const id = '0';
      const name = 'update';

      await providerContariner.read(counterUsecaseProvider).fetchAll();
      await providerContariner.read(counterUsecaseProvider).update(
            id: id,
            name: name,
          );

      // 初期値は'number 0'
      final counter = providerContariner.read(countersProvider.notifier).getCounter(id);
      expect(counter.counterValue.name, name);

      // このようにすることで登録したlistenerを削除できる（ただし、autoDisposeはされなくなる）
      providerContariner
          .listen<List<Counter>>(
            countersProvider,
            (previous, next) => logger.i('listen'),
          )
          .close();
    });
  });

  group('deleteテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    test('任意のCounterを指定すると指定したCounterがstateから削除されていること', () async {
      const id = '0';

      await providerContariner.read(counterUsecaseProvider).delete(id);
      await providerContariner.read(counterUsecaseProvider).fetchAll();

      final counters = providerContariner.read(countersProvider);

      expect(counters.length, 2);
    });
  });

  group('counteUpテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    )..listen<List<Counter>>(
        countersProvider,
        (_, __) => logger.i('listen'),
      );

    test('任意のidを指定すると指定したCounterがCounterValue+1で返却されること（0=>1）', () async {
      const id = '0';
      // まずfetchでデータを取得する
      await providerContariner.read(counterUsecaseProvider).fetchAll();

      final initialCounter = providerContariner.read(countersProvider.notifier).getCounter(id);
      expect(initialCounter.counterValue.count, 0);

      await providerContariner.read(counterUsecaseProvider).countUp(id);
      final addedCounter = providerContariner.read(countersProvider.notifier).getCounter(id);

      expect(addedCounter.counterValue.count, 1);
    });
  });
}
