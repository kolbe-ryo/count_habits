import 'package:count_habits/util/async_execute_mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/object_wrappers.dart';

class BillingUsecase with AsyncExecuteMixin {
  const BillingUsecase(this._ref);

  final Ref _ref;

  // サブスクの初期設定
  Future<void> setup() async {}

  // 会員情報を取得
  Future<CustomerInfo> fetchCustomerInfo() async {
    return CustomerInfo();
  }

  // 購入情報の再取得（端末変更時など）
  Future<CustomerInfo> restorePurchases() async {
    
  };

  // サブスク商品の取得（1種類しか設定予定はないが取得は必須）
  Future<Offerings> offering() async {

  };

  // サブスク購入
  Future<CustomerInfo> purchase() async {

  };
}
