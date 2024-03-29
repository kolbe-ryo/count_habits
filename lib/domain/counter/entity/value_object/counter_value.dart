import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_value.freezed.dart';
part 'counter_value.g.dart';

@freezed
class CounterValue with _$CounterValue {
  const factory CounterValue({
    required String name,
    @Default(0) int count,
  }) = _CounterValue;

  const CounterValue._();

  // Use this for initializing CounterValue
  factory CounterValue.init({required String name}) {
    if (name.isEmpty) {
      throw const AppException(AppExceptionEnum.counterInvalid);
    }
    return CounterValue(name: name);
  }

  factory CounterValue.fromJson(Map<String, dynamic> json) => _$CounterValueFromJson(json);

  CounterValue get increment => copyWith(count: count + 1);
}
