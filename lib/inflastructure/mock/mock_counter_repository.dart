import 'package:collection/collection.dart';
import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/counter/entity/value_object/contribution.dart';
import 'package:count_habits/domain/counter/entity/value_object/counter_value.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';

// テスト用にexceptionフラグを用意しているので通信失敗時のテストの際に利用すること
class MockCounterRepository implements CounterRepository {
  final List<Counter> _counters = [..._initCounter];

  List<Counter> get counters => _counters;

  @override
  Future<Counter> create(
    String name, {
    bool exception = false,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception) {
      throw const AppException(AppExceptionEnum.counterCreate);
    }
    final createCounter = Counter.init(name: name);
    // インメモリに作成したカウンタを保存する
    _counters.add(createCounter);
    return createCounter;
  }

  @override
  Future<List<Counter>> fetchAll({
    bool exception = false,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception) {
      throw const AppException(AppExceptionEnum.counterFetchAll);
    }
    return _counters;
  }

  @override
  Future<Counter> update({
    required String id,
    required String name,
    bool exception = false,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception) {
      throw const AppException(AppExceptionEnum.counterUpdate);
    }
    final updateCounter = _counters.firstWhereOrNull((element) => element.id == id);

    // 要素が見当たらなかった場合予期せぬエラー
    if (updateCounter == null) {
      throw const AppException(AppExceptionEnum.unexpectedException);
    }
    final updatedCounterValue = updateCounter.counterValue.copyWith(name: name);
    _counters[int.parse(id)] = updateCounter.copyWith(counterValue: updatedCounterValue);
    return _counters[int.parse(id)];
  }

  @override
  Future<List<Counter>> delete(
    String id, {
    bool exception = false,
  }) async {
    if (_counters.isEmpty) {
      return [];
    }
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception) {
      throw const AppException(AppExceptionEnum.counterDelete);
    }
    final previousLen = _counters.length;
    _counters.removeWhere((element) => element.id == id);

    // 削除したのに要素に変更がない場合は予期せぬエラー
    if (_counters.length == previousLen) {
      throw const AppException(AppExceptionEnum.unexpectedException);
    }
    return _counters;
  }

  @override
  Future<Counter> checkIn(String id, {bool exception = false}) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception) {
      throw const AppException(AppExceptionEnum.counterCheckIn);
    }
    return _counters[int.parse(id)].checkIn;
  }
}

final _initCounter = [
  Counter(
    id: '0',
    counterValue: const CounterValue(
      name: 'number 0',
    ),
    contribution: Contribution(
      contributedAt: [
        DateTime(2024, 1, 2),
      ],
    ),
  ),
  Counter(
    id: '1',
    counterValue: const CounterValue(
      name: 'number 1',
    ),
    contribution: Contribution(
      contributedAt: [
        DateTime(2024, 1, 2),
        DateTime(2024, 1, 3),
        DateTime(2024, 1, 5),
        DateTime(2024, 1, 11),
      ],
    ),
  ),
  Counter(
    id: '2',
    counterValue: const CounterValue(
      name: 'number 2',
    ),
    contribution: Contribution(
      contributedAt: [
        DateTime(2024, 1, 10),
        DateTime(2024, 1, 20),
        DateTime(2024, 2, 10),
      ],
    ),
  ),
];
