import 'package:freezed_annotation/freezed_annotation.dart';

part 'appearance.freezed.dart';
part 'appearance.g.dart';

@freezed
class Appearance with _$Appearance {
  const factory Appearance({
    // TODO: IDを追加して、新規カウンタ作成時に、counterのIDと紐付けること
    @Default(0) int colorId,
    @Default(0) int fontFamilyId,
  }) = _Appearance;

  factory Appearance.fromJson(Map<String, dynamic> json) => _$AppearanceFromJson(json);
}
