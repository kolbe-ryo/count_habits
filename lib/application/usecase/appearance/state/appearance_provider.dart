import 'package:count_habits/application/usecase/appearance/appearance_usecase.dart';
import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appearance_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Appearance> appearance(AppearanceRef ref) async {
  final appearance = await ref.read(appearanceUsecaseProvider).fetch();
  ref.read(appearanceStateProvider.notifier).setAppearance = appearance;
  return appearance;
}
