// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coloring.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Coloring {
  Color get counterColor => throw _privateConstructorUsedError;
  Color get counterShadow => throw _privateConstructorUsedError;
  Color get contributionColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColoringCopyWith<Coloring> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColoringCopyWith<$Res> {
  factory $ColoringCopyWith(Coloring value, $Res Function(Coloring) then) =
      _$ColoringCopyWithImpl<$Res, Coloring>;
  @useResult
  $Res call({Color counterColor, Color counterShadow, Color contributionColor});
}

/// @nodoc
class _$ColoringCopyWithImpl<$Res, $Val extends Coloring>
    implements $ColoringCopyWith<$Res> {
  _$ColoringCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counterColor = null,
    Object? counterShadow = null,
    Object? contributionColor = null,
  }) {
    return _then(_value.copyWith(
      counterColor: null == counterColor
          ? _value.counterColor
          : counterColor // ignore: cast_nullable_to_non_nullable
              as Color,
      counterShadow: null == counterShadow
          ? _value.counterShadow
          : counterShadow // ignore: cast_nullable_to_non_nullable
              as Color,
      contributionColor: null == contributionColor
          ? _value.contributionColor
          : contributionColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColoringImplCopyWith<$Res>
    implements $ColoringCopyWith<$Res> {
  factory _$$ColoringImplCopyWith(
          _$ColoringImpl value, $Res Function(_$ColoringImpl) then) =
      __$$ColoringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color counterColor, Color counterShadow, Color contributionColor});
}

/// @nodoc
class __$$ColoringImplCopyWithImpl<$Res>
    extends _$ColoringCopyWithImpl<$Res, _$ColoringImpl>
    implements _$$ColoringImplCopyWith<$Res> {
  __$$ColoringImplCopyWithImpl(
      _$ColoringImpl _value, $Res Function(_$ColoringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counterColor = null,
    Object? counterShadow = null,
    Object? contributionColor = null,
  }) {
    return _then(_$ColoringImpl(
      counterColor: null == counterColor
          ? _value.counterColor
          : counterColor // ignore: cast_nullable_to_non_nullable
              as Color,
      counterShadow: null == counterShadow
          ? _value.counterShadow
          : counterShadow // ignore: cast_nullable_to_non_nullable
              as Color,
      contributionColor: null == contributionColor
          ? _value.contributionColor
          : contributionColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ColoringImpl implements _Coloring {
  const _$ColoringImpl(
      {this.counterColor = Colors.green,
      this.counterShadow = Colors.lightGreen,
      this.contributionColor = Colors.lightGreenAccent});

  @override
  @JsonKey()
  final Color counterColor;
  @override
  @JsonKey()
  final Color counterShadow;
  @override
  @JsonKey()
  final Color contributionColor;

  @override
  String toString() {
    return 'Coloring(counterColor: $counterColor, counterShadow: $counterShadow, contributionColor: $contributionColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColoringImpl &&
            (identical(other.counterColor, counterColor) ||
                other.counterColor == counterColor) &&
            (identical(other.counterShadow, counterShadow) ||
                other.counterShadow == counterShadow) &&
            (identical(other.contributionColor, contributionColor) ||
                other.contributionColor == contributionColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, counterColor, counterShadow, contributionColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ColoringImplCopyWith<_$ColoringImpl> get copyWith =>
      __$$ColoringImplCopyWithImpl<_$ColoringImpl>(this, _$identity);
}

abstract class _Coloring implements Coloring {
  const factory _Coloring(
      {final Color counterColor,
      final Color counterShadow,
      final Color contributionColor}) = _$ColoringImpl;

  @override
  Color get counterColor;
  @override
  Color get counterShadow;
  @override
  Color get contributionColor;
  @override
  @JsonKey(ignore: true)
  _$$ColoringImplCopyWith<_$ColoringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
