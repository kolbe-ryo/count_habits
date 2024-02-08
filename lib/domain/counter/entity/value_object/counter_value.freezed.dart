// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CounterValue _$CounterValueFromJson(Map<String, dynamic> json) {
  return _CounterValue.fromJson(json);
}

/// @nodoc
mixin _$CounterValue {
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterValueCopyWith<CounterValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterValueCopyWith<$Res> {
  factory $CounterValueCopyWith(
          CounterValue value, $Res Function(CounterValue) then) =
      _$CounterValueCopyWithImpl<$Res, CounterValue>;
  @useResult
  $Res call({String name, int count});
}

/// @nodoc
class _$CounterValueCopyWithImpl<$Res, $Val extends CounterValue>
    implements $CounterValueCopyWith<$Res> {
  _$CounterValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterValueImplCopyWith<$Res>
    implements $CounterValueCopyWith<$Res> {
  factory _$$CounterValueImplCopyWith(
          _$CounterValueImpl value, $Res Function(_$CounterValueImpl) then) =
      __$$CounterValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int count});
}

/// @nodoc
class __$$CounterValueImplCopyWithImpl<$Res>
    extends _$CounterValueCopyWithImpl<$Res, _$CounterValueImpl>
    implements _$$CounterValueImplCopyWith<$Res> {
  __$$CounterValueImplCopyWithImpl(
      _$CounterValueImpl _value, $Res Function(_$CounterValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_$CounterValueImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CounterValueImpl extends _CounterValue {
  const _$CounterValueImpl({required this.name, this.count = 0}) : super._();

  factory _$CounterValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounterValueImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'CounterValue(name: $name, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterValueImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterValueImplCopyWith<_$CounterValueImpl> get copyWith =>
      __$$CounterValueImplCopyWithImpl<_$CounterValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CounterValueImplToJson(
      this,
    );
  }
}

abstract class _CounterValue extends CounterValue {
  const factory _CounterValue({required final String name, final int count}) =
      _$CounterValueImpl;
  const _CounterValue._() : super._();

  factory _CounterValue.fromJson(Map<String, dynamic> json) =
      _$CounterValueImpl.fromJson;

  @override
  String get name;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$CounterValueImplCopyWith<_$CounterValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
