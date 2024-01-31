import 'package:freezed_annotation/freezed_annotation.dart';

part 'appearance.freezed.dart';
part 'appearance.g.dart';

@freezed
class Appearance with _$Appearance {
  const factory Appearance({
    @Default(0) int colorId,
    String? fontFamily,
  }) = _Appearance;

  factory Appearance.fromJson(Map<String, dynamic> json) => _$AppearanceFromJson(json);
}
