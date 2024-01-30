import 'package:count_habits/domain/exception/validator_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  const factory Counter({
    required String id,
    required String name,
    @Default(0) int count,
    required DateTime? createdAt,
  }) = _Counter;

  // Use this for initializing Counter
  factory Counter.init({required String name}) {
    if (name.isEmpty) {
      throw const ValidatorException('カウンタ名が空です');
    }
    return Counter(
      id: const Uuid().v4(),
      name: name,
      createdAt: DateTime.now(),
    );
  }

  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);
}
