import 'package:count_habits/domain/billing/billing_repository.dart';
import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:purchases_flutter/object_wrappers.dart';

const _customerInfo = CustomerInfo(
  EntitlementInfos({}, {}),
  {},
  [],
  [],
  [],
  '',
  '',
  {},
  '',
);

const _offerings = Offerings(
  {
    'test': Offering(
      'test',
      'mock',
      {},
      [
        Package(
          'test',
          PackageType.lifetime,
          StoreProduct(
            'identifier',
            'description',
            'title',
            10,
            '10',
            'JPY',
          ),
          PresentedOfferingContext(
            'offeringIdentifier',
            'placementIdentifier',
            null,
          ),
        ),
      ],
    ),
  },
);

class MockBillingRepository implements BillingRepository {
  @override
  Future<CustomerInfo> customerInfo({bool exception = false}) async {
    if (exception) {
      throw const AppException(AppExceptionEnum.billingCustomer);
    }
    return _customerInfo;
  }

  @override
  Future<Offerings> offering({bool exception = false}) async {
    if (exception) {
      throw const AppException(AppExceptionEnum.billingOfferings);
    }
    return _offerings;
  }

  @override
  Future<CustomerInfo> purchase({required Offering offering, bool exception = false}) async {
    if (exception) {
      throw const AppException(AppExceptionEnum.billingPurchace);
    }
    return _customerInfo;
  }

  @override
  Future<CustomerInfo> restorePurchases({bool exception = false}) async {
    if (exception) {
      throw const AppException(AppExceptionEnum.billingRestorePurchace);
    }
    return _customerInfo;
  }

  @override
  Future<void> setUp({bool exception = false}) async {
    if (exception) {
      throw const AppException(AppExceptionEnum.billingSetup);
    }
  }
}
