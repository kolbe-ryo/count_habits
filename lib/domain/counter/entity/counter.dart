import 'package:count_habits/domain/exception/validator_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  const factory Counter({
    required String name,
    @Default(0) int count,
    required DateTime? createdAt,
  }) = _Counter;

  factory Counter.withValidation({
    required String name,
    required int count,
  }) {
    if (name.isEmpty) {
      throw const ValidatorException('カウンタ名が空です');
    }
    return Counter(
      name: name,
      count: count,
      createdAt: DateTime.now(),
    );
  }

  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);
}
