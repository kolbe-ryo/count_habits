import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/object_wrappers.dart';

part 'billing.freezed.dart';

@freezed
class Billing with _$Billing {
  const factory Billing({
    CustomerInfo? customerInfo,
    Offerings? offerings,
  }) = _Billing;
}
