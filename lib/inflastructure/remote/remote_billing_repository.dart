import 'package:count_habits/domain/billing/billing_repository.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';
import 'package:purchases_flutter/models/offerings_wrapper.dart';

class RemoteBillingRepository implements BillingRepository {
  @override
  Future<CustomerInfo> customerInfo({bool exception = false}) {
    // TODO: implement customerInfo
    throw UnimplementedError();
  }

  @override
  Future<Offerings> offering({bool exception = false}) {
    // TODO: implement offering
    throw UnimplementedError();
  }

  @override
  Future<CustomerInfo> purchase({required Offering offering, bool exception = false}) {
    // TODO: implement purchase
    throw UnimplementedError();
  }

  @override
  Future<CustomerInfo> restorePurchases({bool exception = false}) {
    // TODO: implement restorePurchases
    throw UnimplementedError();
  }

  @override
  Future<void> setUp({bool exception = false}) {
    // TODO: implement setUp
    throw UnimplementedError();
  }
}
