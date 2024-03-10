// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appearance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Appearance _$AppearanceFromJson(Map<String, dynamic> json) {
  return _Appearance.fromJson(json);
}

/// @nodoc
mixin _$Appearance {
  int get colorId => throw _privateConstructorUsedError;
  int get fontFamilyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppearanceCopyWith<Appearance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppearanceCopyWith<$Res> {
  factory $AppearanceCopyWith(
          Appearance value, $Res Function(Appearance) then) =
      _$AppearanceCopyWithImpl<$Res, Appearance>;
  @useResult
  $Res call({int colorId, int fontFamilyId});
}

/// @nodoc
class _$AppearanceCopyWithImpl<$Res, $Val extends Appearance>
    implements $AppearanceCopyWith<$Res> {
  _$AppearanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = null,
    Object? fontFamilyId = null,
  }) {
    return _then(_value.copyWith(
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      fontFamilyId: null == fontFamilyId
          ? _value.fontFamilyId
          : fontFamilyId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppearanceImplCopyWith<$Res>
    implements $AppearanceCopyWith<$Res> {
  factory _$$AppearanceImplCopyWith(
          _$AppearanceImpl value, $Res Function(_$AppearanceImpl) then) =
      __$$AppearanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int colorId, int fontFamilyId});
}

/// @nodoc
class __$$AppearanceImplCopyWithImpl<$Res>
    extends _$AppearanceCopyWithImpl<$Res, _$AppearanceImpl>
    implements _$$AppearanceImplCopyWith<$Res> {
  __$$AppearanceImplCopyWithImpl(
      _$AppearanceImpl _value, $Res Function(_$AppearanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorId = null,
    Object? fontFamilyId = null,
  }) {
    return _then(_$AppearanceImpl(
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      fontFamilyId: null == fontFamilyId
          ? _value.fontFamilyId
          : fontFamilyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppearanceImpl implements _Appearance {
  const _$AppearanceImpl({this.colorId = 0, this.fontFamilyId = 0});

  factory _$AppearanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppearanceImplFromJson(json);

  @override
  @JsonKey()
  final int colorId;
  @override
  @JsonKey()
  final int fontFamilyId;

  @override
  String toString() {
    return 'Appearance(colorId: $colorId, fontFamilyId: $fontFamilyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppearanceImpl &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.fontFamilyId, fontFamilyId) ||
                other.fontFamilyId == fontFamilyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, colorId, fontFamilyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppearanceImplCopyWith<_$AppearanceImpl> get copyWith =>
      __$$AppearanceImplCopyWithImpl<_$AppearanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppearanceImplToJson(
      this,
    );
  }
}

abstract class _Appearance implements Appearance {
  const factory _Appearance({final int colorId, final int fontFamilyId}) =
      _$AppearanceImpl;

  factory _Appearance.fromJson(Map<String, dynamic> json) =
      _$AppearanceImpl.fromJson;

  @override
  int get colorId;
  @override
  int get fontFamilyId;
  @override
  @JsonKey(ignore: true)
  _$$AppearanceImplCopyWith<_$AppearanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
