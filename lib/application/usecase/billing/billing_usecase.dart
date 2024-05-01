import 'package:count_habits/util/async_execute_mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BillingUsecase with AsyncExecuteMixin {
  const BillingUsecase(this._ref);

  final Ref _ref;
}
