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
// TODO: IDを追加して、新規カウンタ作成時に、counterのIDと紐付けること
  int get colorId => throw _privateConstructorUsedError;
  String get fontFamily => throw _privateConstructorUsedError;

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
  $Res call({int colorId, String fontFamily});
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
    Object? fontFamily = null,
  }) {
    return _then(_value.copyWith(
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({int colorId, String fontFamily});
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
    Object? fontFamily = null,
  }) {
    return _then(_$AppearanceImpl(
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppearanceImpl implements _Appearance {
  const _$AppearanceImpl(
      {this.colorId = 0, this.fontFamily = 'Monomaniac_One'});

  factory _$AppearanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppearanceImplFromJson(json);

// TODO: IDを追加して、新規カウンタ作成時に、counterのIDと紐付けること
  @override
  @JsonKey()
  final int colorId;
  @override
  @JsonKey()
  final String fontFamily;

  @override
  String toString() {
    return 'Appearance(colorId: $colorId, fontFamily: $fontFamily)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppearanceImpl &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, colorId, fontFamily);

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
  const factory _Appearance({final int colorId, final String fontFamily}) =
      _$AppearanceImpl;

  factory _Appearance.fromJson(Map<String, dynamic> json) =
      _$AppearanceImpl.fromJson;

  @override // TODO: IDを追加して、新規カウンタ作成時に、counterのIDと紐付けること
  int get colorId;
  @override
  String get fontFamily;
  @override
  @JsonKey(ignore: true)
  _$$AppearanceImplCopyWith<_$AppearanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
