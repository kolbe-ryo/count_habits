import 'package:flutter_riverpod/flutter_riverpod.dart';

final appearanceProvider = Provider<AppearanceUsecase>(AppearanceUsecase.new);

class AppearanceUsecase {
  const AppearanceUsecase(this._ref);

  final Ref _ref;

  Future<void> fetch() async {}
  Future<void> update() async {}
  Future<void> reset() async {}
}
