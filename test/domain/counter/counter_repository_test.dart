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

  late ProviderContainer providerContainer;

  setUpAll(() async {
    // ローカルストレージをを用いる場合はこちらを利用する
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    final localCounterRepository = LocalCounterRepository(sharedPreferences: sharedPreferences);

    providerContainer = ProviderContainer(
      overrides: [
        counterRepositoryProvider.overrideWithValue(localCounterRepository),
      ],
    );
  });

  group('createテスト', () {
    test('作成に成功した場合、引数で与えた任意のnameが設定されたCounterが存在すること', () async {
      const name = 'create';
      final addNewCounters = await providerContainer.read(counterRepositoryProvider).create(name);
      expect(addNewCounters.last.counterValue.name, name);
      logger.i(addNewCounters.length);
      await providerContainer.read(counterRepositoryProvider).deleteAll();
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

  group('fetchAllテスト', () {
    test('取得に成功した場合、すべてのCounterが返却されること', () async {
      await providerContainer.read(counterRepositoryProvider).create('first');
      await providerContainer.read(counterRepositoryProvider).create('second');
      final counters = await providerContainer.read(counterRepositoryProvider).create('third');
      expect(counters, isA<List<Counter>>());
      expect(counters.length, 3);

      // 作成したものを削除しておく
      await providerContainer.read(counterRepositoryProvider).deleteAll();
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
    const name = 'update';
    test('更新に成功した場合、引数で与えた任意のnameが設定されていること', () async {
      final initCounter = await providerContainer.read(counterRepositoryProvider).create('create');
      final counter = await providerContainer.read(counterRepositoryProvider).update(
            id: initCounter.first.id,
            name: name,
          );
      expect(counter.id, initCounter.first.id);
      expect(counter.counterValue.name, name);
    });
    test('インフラで更新に失敗した場合、AppExceptionがthrowされること', () async {
      final initCounter = await providerContainer.read(counterRepositoryProvider).fetchAll();
      expect(
        () async {
          await providerContainer.read(counterRepositoryProvider).update(
                id: initCounter.first.id,
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
        throwsA(const AppException(AppExceptionEnum.counterUpdate)),
      );
    });
  });

// TODO テストを通す
  group('deleteテスト', () {
    test('削除に成功した場合、指定したidのCounterが削除されていること', () async {
      // 作成したものを削除しておく
      await providerContainer.read(counterRepositoryProvider).deleteAll();

      final counters = await providerContainer.read(counterRepositoryProvider).create('delete');
      final counterId = counters.first.id;
      final deleteCounters = await providerContainer.read(counterRepositoryProvider).delete(counterId);
      expect(deleteCounters.isEmpty, true);
    });
    test('インフラで更新に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          // 作成したものを削除しておく
          await providerContainer.read(counterRepositoryProvider).deleteAll();

          final counters = await providerContainer.read(counterRepositoryProvider).create('delete');
          final counterId = counters.first.id;
          await providerContainer.read(counterRepositoryProvider).delete(
                counterId,
                exception: true,
              );
        },
        throwsA(const AppException(AppExceptionEnum.counterDelete)),
      );
    });
    test('id不一致で削除に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          // 作成したものを削除しておく
          await providerContainer.read(counterRepositoryProvider).deleteAll();

          await providerContainer.read(counterRepositoryProvider).create('delete');
          await providerContainer.read(counterRepositoryProvider).delete(
                'nothing',
              );
        },
        throwsA(const AppException(AppExceptionEnum.counterDelete)),
      );
    });
    test('id不一致で更新に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          // 作成したものを削除しておく
          await providerContainer.read(counterRepositoryProvider).deleteAll();

          await providerContainer.read(counterRepositoryProvider).create('delete');
          await providerContainer.read(counterRepositoryProvider).delete(
                'nothing',
              );
        },
        throwsA(const AppException(AppExceptionEnum.counterDelete)),
      );
    });
  });

  group('checkInテスト', () {
    test('カウントアップに成功した場合、CounterValueは+1、Contributionは+1要素されていること', () async {
      await providerContainer.read(counterRepositoryProvider).deleteAll();
      final counters = await providerContainer.read(counterRepositoryProvider).create('checkIn');
      final counter = counters.first;
      final counterCheckedIn = await providerContainer.read(counterRepositoryProvider).checkIn(counter.id);
      expect(counterCheckedIn.counterValue.count, counter.counterValue.count + 1);
      expect(counterCheckedIn.contribution.contributedAt.length, counter.contribution.contributedAt.length + 1);
    });
    test('更新に失敗した場合、AppExceptionがthrowされること', () {
      expect(
        () async {
          await providerContainer.read(counterRepositoryProvider).deleteAll();
          final counters = await providerContainer.read(counterRepositoryProvider).create('checkIn');
          final counter = counters.first;
          await providerContainer.read(counterRepositoryProvider).checkIn(
                counter.id,
                exception: true,
              );
        },
        throwsA(const AppException(AppExceptionEnum.counterCheckIn)),
      );
    });
  });
}
