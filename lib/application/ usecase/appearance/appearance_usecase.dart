import 'package:count_habits/application/%20usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/domain/apprearance/appearance_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appearanceProvider = Provider<AppearanceUsecase>(AppearanceUsecase.new);

class AppearanceUsecase {
  const AppearanceUsecase(this._ref);

  final Ref _ref;

  Future<void> fetch() async {
    final currentAppearance = await _ref.read(appearanceRepositoryProvider).fetch();
    _ref.read(appearanceStateProvider.notifier).setAppearance = currentAppearance;
  }

  // TODO: Implement
  Future<void> update() async {}

  Future<void> reset() async {}
}
