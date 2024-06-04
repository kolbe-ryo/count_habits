// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Billing {
  CustomerInfo? get customerInfo => throw _privateConstructorUsedError;
  Offerings? get offerings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillingCopyWith<Billing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingCopyWith<$Res> {
  factory $BillingCopyWith(Billing value, $Res Function(Billing) then) =
      _$BillingCopyWithImpl<$Res, Billing>;
  @useResult
  $Res call({CustomerInfo? customerInfo, Offerings? offerings});

  $CustomerInfoCopyWith<$Res>? get customerInfo;
  $OfferingsCopyWith<$Res>? get offerings;
}

/// @nodoc
class _$BillingCopyWithImpl<$Res, $Val extends Billing>
    implements $BillingCopyWith<$Res> {
  _$BillingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerInfo = freezed,
    Object? offerings = freezed,
  }) {
    return _then(_value.copyWith(
      customerInfo: freezed == customerInfo
          ? _value.customerInfo
          : customerInfo // ignore: cast_nullable_to_non_nullable
              as CustomerInfo?,
      offerings: freezed == offerings
          ? _value.offerings
          : offerings // ignore: cast_nullable_to_non_nullable
              as Offerings?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerInfoCopyWith<$Res>? get customerInfo {
    if (_value.customerInfo == null) {
      return null;
    }

    return $CustomerInfoCopyWith<$Res>(_value.customerInfo!, (value) {
      return _then(_value.copyWith(customerInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OfferingsCopyWith<$Res>? get offerings {
    if (_value.offerings == null) {
      return null;
    }

    return $OfferingsCopyWith<$Res>(_value.offerings!, (value) {
      return _then(_value.copyWith(offerings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillingImplCopyWith<$Res> implements $BillingCopyWith<$Res> {
  factory _$$BillingImplCopyWith(
          _$BillingImpl value, $Res Function(_$BillingImpl) then) =
      __$$BillingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CustomerInfo? customerInfo, Offerings? offerings});

  @override
  $CustomerInfoCopyWith<$Res>? get customerInfo;
  @override
  $OfferingsCopyWith<$Res>? get offerings;
}

/// @nodoc
class __$$BillingImplCopyWithImpl<$Res>
    extends _$BillingCopyWithImpl<$Res, _$BillingImpl>
    implements _$$BillingImplCopyWith<$Res> {
  __$$BillingImplCopyWithImpl(
      _$BillingImpl _value, $Res Function(_$BillingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerInfo = freezed,
    Object? offerings = freezed,
  }) {
    return _then(_$BillingImpl(
      customerInfo: freezed == customerInfo
          ? _value.customerInfo
          : customerInfo // ignore: cast_nullable_to_non_nullable
              as CustomerInfo?,
      offerings: freezed == offerings
          ? _value.offerings
          : offerings // ignore: cast_nullable_to_non_nullable
              as Offerings?,
    ));
  }
}

/// @nodoc

class _$BillingImpl implements _Billing {
  const _$BillingImpl({this.customerInfo, this.offerings});

  @override
  final CustomerInfo? customerInfo;
  @override
  final Offerings? offerings;

  @override
  String toString() {
    return 'Billing(customerInfo: $customerInfo, offerings: $offerings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingImpl &&
            (identical(other.customerInfo, customerInfo) ||
                other.customerInfo == customerInfo) &&
            (identical(other.offerings, offerings) ||
                other.offerings == offerings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerInfo, offerings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingImplCopyWith<_$BillingImpl> get copyWith =>
      __$$BillingImplCopyWithImpl<_$BillingImpl>(this, _$identity);
}

abstract class _Billing implements Billing {
  const factory _Billing(
      {final CustomerInfo? customerInfo,
      final Offerings? offerings}) = _$BillingImpl;

  @override
  CustomerInfo? get customerInfo;
  @override
  Offerings? get offerings;
  @override
  @JsonKey(ignore: true)
  _$$BillingImplCopyWith<_$BillingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
