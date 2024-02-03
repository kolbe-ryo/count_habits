import 'package:count_habits/domain/counter/counter_repository.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/counter/entity/value_object/contribution.dart';
import 'package:count_habits/domain/counter/entity/value_object/counter_value.dart';
import 'package:count_habits/domain/exception/app_exception.dart';

class MockCounterRepository implements CounterRepository {
  @override
  Future<List<Counter>> fetchAll([bool? exception]) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception ?? false) {
      throw const AppException('カウンタ一覧の取得に失敗しました');
    }
    return _counters;
  }

  @override
  Future<Counter> update({
    required String id,
    required String name,
    bool? exception,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception ?? false) {
      throw const AppException('カウンタの更新に失敗しました');
    }
    return _counters[int.parse(id)];
  }

  @override
  Future<List<Counter>> delete(String id, [bool? exception]) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (exception ?? false) {
      throw const AppException('カウンタの削除に失敗しました');
    }
    _counters.removeAt(int.parse(id));
    return _counters;
  }
}

final _counters = [
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
