import 'package:count_habits/util/async_execute_mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/object_wrappers.dart';

class BillingUsecase with AsyncExecuteMixin {
  const BillingUsecase(this._ref);

  final Ref _ref;

  Future<void> setup() async {}

  Future<CustomerInfo> fetchCustomerInfo() async {
    return CustomerInfo();
  }
}
