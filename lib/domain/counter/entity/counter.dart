import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  const factory Counter({
    required String title,
    required int count,
    required DateTime? createdAt,
  }) = _Counter;

  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);
}
