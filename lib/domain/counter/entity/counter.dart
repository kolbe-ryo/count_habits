import 'package:count_habits/domain/counter/entity/value_object/contribution.dart';
import 'package:count_habits/domain/counter/entity/value_object/counter_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  const factory Counter({
    required String id,
    required CounterValue counterValue,
    required Contribution contribution,
  }) = _Counter;

  const Counter._();

  // Use this for initializing Counter
  factory Counter.init({required String name}) {
    return Counter(
      id: const Uuid().v4(),
      counterValue: CounterValue.init(name: name),
      contribution: const Contribution(),
    );
  }

  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);

  /// Add Counter and Contribution in the last
  Counter get checkIn {
    final now = DateTime.now();
    return copyWith(
      counterValue: counterValue.increment,
      contribution: Contribution(
        contributedAt: [
          ...contribution.contributedAt,
          DateTime(now.year, now.month, now.day),
        ],
      ),
    );
  }

  /// Changes the name of the Counter.
  ///
  /// Returns a new Counter with the updated name.
  Counter changeName(String name) {
    return copyWith(
      counterValue: counterValue.copyWith(name: name),
    );
  }

  /// Checks if a check-in was made today.
  ///
  /// Returns true if a check-in was made today, false otherwise.
  bool get didCheckIn => contribution.contributedAt.any(
        (datetime) => datetime.difference(DateTime.now()).inDays == 0,
      );

  int get maxConsecutiveCount {
    final contributedAt = contribution.contributedAt;
    if (contributedAt.isEmpty) {
      return 0;
    }

    // 最大値保持用の変数
    var maxConsecutiveCount = 1;

    // 一時保存用の変数
    var currentConsecutiveCount = 1;

    for (var i = 1; i < contributedAt.length; i++) {
      // 日付が連続している場合
      if (contributedAt[i].difference(contributedAt[i - 1]).inDays == 1) {
        currentConsecutiveCount++;
        continue;
      }
      // 日付が連続していない場合
      // 暫定最大値を超過している場合
      if (currentConsecutiveCount > maxConsecutiveCount) {
        maxConsecutiveCount = currentConsecutiveCount;
      }
      // 連続カウントをリセットする
      currentConsecutiveCount = 1;
    }
    return currentConsecutiveCount > maxConsecutiveCount ? currentConsecutiveCount : maxConsecutiveCount;
  }
}
