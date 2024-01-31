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

  // Use this for initializing Counter
  factory Counter.init({required String name}) {
    return Counter(
      id: const Uuid().v4(),
      counterValue: CounterValue.init(name: name),
      contribution: Contribution.init(),
    );
  }

  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);
}
