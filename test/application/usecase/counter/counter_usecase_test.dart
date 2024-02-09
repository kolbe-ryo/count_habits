import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/inflastructure/mock/mock_counter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';

void main() {
  group('fetchテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContariner = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    test('', () async {});
  });
}
