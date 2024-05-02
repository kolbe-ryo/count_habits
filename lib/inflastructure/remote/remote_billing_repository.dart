import 'package:count_habits/domain/billing/billing_repository.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/util/constants/logger.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

// TODO: apikeyは環境変数などに変更すること（下記はダミー）
const dummyKey = 'qwertyuiop@[ASDFGHJKL+*}zxcvbnm,./_]';

class RemoteBillingRepository implements BillingRepository {
  @override
  Future<CustomerInfo> customerInfo({bool exception = false}) async {
    try {
      return await Purchases.getCustomerInfo();
    } on PlatformException catch (e) {
      logger.i(e);
      throw const AppException(AppExceptionEnum.billingCustomer);
    }
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
