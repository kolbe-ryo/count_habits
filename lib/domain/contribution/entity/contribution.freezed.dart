// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contribution _$ContributionFromJson(Map<String, dynamic> json) {
  return _Contribution.fromJson(json);
}

/// @nodoc
mixin _$Contribution {
  String get id => throw _privateConstructorUsedError;
  List<DateTime> get contributedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContributionCopyWith<Contribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionCopyWith<$Res> {
  factory $ContributionCopyWith(
          Contribution value, $Res Function(Contribution) then) =
      _$ContributionCopyWithImpl<$Res, Contribution>;
  @useResult
  $Res call({String id, List<DateTime> contributedAt});
}

/// @nodoc
class _$ContributionCopyWithImpl<$Res, $Val extends Contribution>
    implements $ContributionCopyWith<$Res> {
  _$ContributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contributedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contributedAt: null == contributedAt
          ? _value.contributedAt
          : contributedAt // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContributionImplCopyWith<$Res>
    implements $ContributionCopyWith<$Res> {
  factory _$$ContributionImplCopyWith(
          _$ContributionImpl value, $Res Function(_$ContributionImpl) then) =
      __$$ContributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<DateTime> contributedAt});
}

/// @nodoc
class __$$ContributionImplCopyWithImpl<$Res>
    extends _$ContributionCopyWithImpl<$Res, _$ContributionImpl>
    implements _$$ContributionImplCopyWith<$Res> {
  __$$ContributionImplCopyWithImpl(
      _$ContributionImpl _value, $Res Function(_$ContributionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contributedAt = null,
  }) {
    return _then(_$ContributionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contributedAt: null == contributedAt
          ? _value._contributedAt
          : contributedAt // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributionImpl extends _Contribution {
  const _$ContributionImpl(
      {required this.id, required final List<DateTime> contributedAt})
      : _contributedAt = contributedAt,
        super._();

  factory _$ContributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributionImplFromJson(json);

  @override
  final String id;
  final List<DateTime> _contributedAt;
  @override
  List<DateTime> get contributedAt {
    if (_contributedAt is EqualUnmodifiableListView) return _contributedAt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributedAt);
  }

  @override
  String toString() {
    return 'Contribution(id: $id, contributedAt: $contributedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._contributedAt, _contributedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_contributedAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionImplCopyWith<_$ContributionImpl> get copyWith =>
      __$$ContributionImplCopyWithImpl<_$ContributionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributionImplToJson(
      this,
    );
  }
}

abstract class _Contribution extends Contribution {
  const factory _Contribution(
      {required final String id,
      required final List<DateTime> contributedAt}) = _$ContributionImpl;
  const _Contribution._() : super._();

  factory _Contribution.fromJson(Map<String, dynamic> json) =
      _$ContributionImpl.fromJson;

  @override
  String get id;
  @override
  List<DateTime> get contributedAt;
  @override
  @JsonKey(ignore: true)
  _$$ContributionImplCopyWith<_$ContributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
