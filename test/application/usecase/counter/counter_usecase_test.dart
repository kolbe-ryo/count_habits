import 'package:count_habits/application/%20usecase/counter/counter_usecase.dart';
import 'package:count_habits/application/%20usecase/counter/state/counters_provider.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/inflastructure/mock/mock_counter_repository.dart';
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
    test('fetchAllテスト', () async {});
  });

  group('updateテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    test('updateテスト', () async {});
  });

  group('deleteテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    test('deleteテスト', () async {});
  });

  group('counteUpテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    test('counteUpテスト', () async {});
  });
}
