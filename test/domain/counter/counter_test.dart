import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/domain/counter/entity/value_object/contribution.dart';
import 'package:count_habits/domain/counter/entity/value_object/counter_value.dart';
import 'package:test/test.dart';

void main() {
  group('checkInメソッドのロジックテスト', () {
    test('メソッドコールでCounterValu1増加すること', () {
      final counter = Counter.init(name: 'counter');
      expect(counter.counterValue.count, 0);
      final checkInCounter = counter.checkIn;
      expect(checkInCounter.counterValue.count, 1);
    });
    test('メソッドコールでDateTimeが1件増加すること', () {
      final counter = Counter.init(name: 'counter');
      expect(counter.contribution.contributedAt.length, 0);
      final checkInCounter = counter.checkIn;
      expect(checkInCounter.contribution.contributedAt.length, 1);
    });
  });

  group('didCheckInメソッドのロジックテスト', () {
    test('', () {
      final contribution = Contribution(
        contributedAt: [
          DateTime(2024, 1, 11),
          DateTime(2024, 1, 12),
          DateTime(2024, 1, 14),
        ],
      );
      final counter = Counter(
        id: '0',
        counterValue: CounterValue.init(name: 'name'),
        contribution: contribution,
      );
      // チェックイン前はfalseである
      expect(counter.didCheckIn, false);

      // チェックイン後はtrueである
      final checkInCounter = counter.checkIn;
      expect(checkInCounter.didCheckIn, true);
    });
  });

  group('maxConsecutiveCountメソッドのロジックテスト', () {
    test('maxConsecutiveCountメソッドで初期化時には0が返却されること', () {
      final counter = Counter.init(name: 'counter');
      expect(counter.maxConsecutiveCount, 0);
    });
    test('複数のDateTimeが登録されている場合、最大値が取得可能なこと', () {
      final contributedAt = [
        DateTime(2024),
        DateTime(2024, 1, 2),
        DateTime(2024, 1, 3),
        DateTime(2024, 1, 10),
        DateTime(2024, 1, 11),
        DateTime(2024, 1, 20),
      ];
      final contribution = Contribution(contributedAt: contributedAt);
      final counter = Counter.init(name: 'counter').copyWith(contribution: contribution);
      expect(counter.maxConsecutiveCount, 3);
    });
    test('同じ最大連続日が複数ある場合、どちらかが取得可能なこと', () {
      final contributedAt = [
        DateTime(2024),
        DateTime(2024, 1, 2),
        DateTime(2024, 1, 10),
        DateTime(2024, 1, 11),
        DateTime(2024, 1, 20),
      ];
      final contribution = Contribution(contributedAt: contributedAt);
      final counter = Counter.init(name: 'counter').copyWith(contribution: contribution);
      expect(counter.maxConsecutiveCount, 2);
    });
  });
}
