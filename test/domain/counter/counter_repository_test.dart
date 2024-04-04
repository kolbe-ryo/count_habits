import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/inflastructure/local/local_counter_repository.dart';
import 'package:count_habits/inflastructure/mock/mock_counter_repository.dart';
import 'package:count_habits/util/constants/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() async {
  // モックでテストを行う場合はこちらを利用する
  // final mockCounterRepository = MockCounterRepository();

  // ローカルストレージをを用いる場合はこちらを利用する
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  final sharedPreferences = await SharedPreferences.getInstance();
  final localCounterRepository = LocalCounterRepository(sharedPreferences: sharedPreferences);

  final providerContainer = ProviderContainer(
    overrides: [
      counterRepositoryProvider.overrideWithValue(localCounterRepository),
    ],
  );

  group('createテスト', () {
    test('作成に成功した場合、引数で与えた任意のnameが設定されたCounterが存在すること', () async {
      const name = 'create';
      final addNewCounters = await providerContainer.read(counterRepositoryProvider).create(name);
      expect(addNewCounters.last.counterValue.name, name);
      logger.i(addNewCounters.length);
    });
    test('作成に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          const name = 'create';
          await providerContainer.read(counterRepositoryProvider).create(name, exception: true);
        },
        throwsA(const AppException(AppExceptionEnum.counterCreate)),
      );
    });
  });

// TODO テストを通す
  group('fetchAllテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContainer = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    test('取得に成功した場合、すべてのCounterが返却されること', () async {
      final counters = await providerContainer.read(counterRepositoryProvider).fetchAll();
      expect(counters, isA<List<Counter>>());
      expect(counters.length, 3);
    });
    test('取得に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          await providerContainer.read(counterRepositoryProvider).fetchAll(exception: true);
        },
        throwsA(const AppException(AppExceptionEnum.counterFetchAll)),
      );
    });
  });

  group('updateテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContainer = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    const id = '0';
    const name = 'update';
    test('更新に成功した場合、引数で与えた任意のnameが設定されていること', () async {
      final counter = await providerContainer.read(counterRepositoryProvider).update(
            id: id,
            name: name,
          );
      expect(counter.id, id);
      expect(counter.counterValue.name, name);
    });
    test('インフラで更新に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          await providerContainer.read(counterRepositoryProvider).update(
                id: id,
                name: name,
                exception: true,
              );
        },
        throwsA(const AppException(AppExceptionEnum.counterUpdate)),
      );
    });
    test('id不一致で更新に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          await providerContainer.read(counterRepositoryProvider).update(
                id: 'nothing',
                name: name,
              );
        },
        throwsA(const AppException(AppExceptionEnum.unexpectedException)),
      );
    });
  });

  group('deleteテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContainer = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    const id = '0';

    test('削除に成功した場合、指定したidのCounterが削除されていること', () async {
      final counters = await providerContainer.read(counterRepositoryProvider).fetchAll();
      expect(counters.first.id, id);
      final deleteCounters = await providerContainer.read(counterRepositoryProvider).delete(id);
      expect(deleteCounters.first.id == id, false);
    });
    test('インフラで更新に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          await providerContainer.read(counterRepositoryProvider).delete(
                id,
                exception: true,
              );
        },
        throwsA(const AppException(AppExceptionEnum.counterDelete)),
      );
    });
    test('id不一致で更新に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          await providerContainer.read(counterRepositoryProvider).delete(
                id,
              );
        },
        throwsA(const AppException(AppExceptionEnum.unexpectedException)),
      );
    });
  });

  group('checkInテスト', () {
    final mockCounterRepository = MockCounterRepository();
    final providerContainer = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(mockCounterRepository),
      ],
    );
    const id = '0';

    test('カウントアップに成功した場合、CounterValueは+1、Contributionは+1要素されていること', () async {
      final counters = await providerContainer.read(counterRepositoryProvider).fetchAll();
      final counter = counters[int.parse(id)];
      final counterCheckedIn = await providerContainer.read(counterRepositoryProvider).checkIn(
            id,
          );
      expect(counterCheckedIn.counterValue.count, counter.counterValue.count + 1);
      expect(counterCheckedIn.contribution.contributedAt.length, counter.contribution.contributedAt.length + 1);
    });
    test('更新に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          await providerContainer.read(counterRepositoryProvider).checkIn(
                id,
                exception: true,
              );
        },
        throwsA(const AppException(AppExceptionEnum.counterCheckIn)),
      );
    });
  });
}
