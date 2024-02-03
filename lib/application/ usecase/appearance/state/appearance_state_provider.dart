import 'package:count_habits/domain/apprearance/entity/appearance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appearance_state_provider.g.dart';

@riverpod
class AppearanceState extends _$AppearanceState {
  @override
  Appearance build() => const Appearance();

  void setColorPalette(int colorId) => state = state.copyWith(colorId: colorId);

  void setFontFamily(String fontFamily) => state = state.copyWith(fontFamily: fontFamily);
}
