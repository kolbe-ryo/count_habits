import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final billingRepositoryProvider = Provider<BillingRepository>((ref) => throw UnimplementedError());

abstract interface class BillingRepository {
  Future<void> setUp({bool exception = false});

  Future<CustomerInfo> customerInfo({bool exception = false});

  Future<CustomerInfo> restorePurchases({bool exception = false});

  Future<Offerings> offering({bool exception = false});

  Future<CustomerInfo> purchase({required Offering offering, bool exception = false});
}
