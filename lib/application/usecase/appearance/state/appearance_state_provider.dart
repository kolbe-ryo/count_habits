import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appearance_state_provider.g.dart';

// Appreanceは本来であればAppearanceProviderだけで状態管理すれば良いが、依存箇所が多すぎるため、使用箇所で一々AsyncValueを取り扱わず、
// appearanceの変更時に通信を待って、StateProviderとして取り扱う。
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
