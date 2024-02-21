// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppearanceImpl _$$AppearanceImplFromJson(Map<String, dynamic> json) =>
    _$AppearanceImpl(
      colorId: json['colorId'] as int? ?? 0,
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      fontFamily: json['fontFamily'] as String? ?? 'Monomaniac_One',
    );

Map<String, dynamic> _$$AppearanceImplToJson(_$AppearanceImpl instance) =>
    <String, dynamic>{
      'colorId': instance.colorId,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'fontFamily': instance.fontFamily,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
