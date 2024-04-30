import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final billingRepositoryProvider = Provider<BillingRepository>((ref) => throw UnimplementedError());

abstract interface class BillingRepository {
  Future<void> setUp({bool exception = false});

  Future<CustomerInfo> customerInfo({bool exception = false});

  Future<CustomerInfo> restorePurchases({bool exception = false});

  Future<Offering> offering({bool exception = false});

  Future<CustomerInfo> purchase({Offering offering, bool exception = false});
}


// TODO こちらを参考にproviderを構築すること
// @riverpod
// class TodoState extends _$TodoState {
//   @override
//   FutureOr<Todo> build(String id) async {
//   final json = await http.get('https://api.example.com/todos/$id');
//   return Todo.fromJson(json);
//   }
// }