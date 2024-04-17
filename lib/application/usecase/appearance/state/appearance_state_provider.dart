import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appearance_state_provider.g.dart';

@riverpod
class AppearanceState extends _$AppearanceState {
  @override
  Appearance build() => const Appearance();

  // ignore: avoid_setters_without_getters
  set setAppearance(Appearance appearance) => state = appearance;

  void setColorPalette(int colorId) => state = state.copyWith(colorId: colorId);

  void setFontFamily(int fontFamilyId) => state = state.copyWith(fontFamilyId: fontFamilyId);

  void reset() => state = const Appearance();
}
