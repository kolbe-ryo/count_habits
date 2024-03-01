import 'package:flutter/cupertino.dart';

const colorSchemes = <int, CupertinoThemeData>{
  0: customColorScheme0,
  1: customColorScheme1,
  2: customColorScheme2,
  3: customColorScheme3,
  4: customColorScheme4,
  5: customColorScheme5,
  6: customColorScheme6,
  7: customColorScheme7,
  8: customColorScheme8,
  9: customColorScheme9,
  10: customColorScheme10,
  11: customColorScheme11,
};

// 西鉄カラー
const customColorScheme0 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFF4538A),
  primaryContrastingColor: Color(0xFFFAA300),
  scaffoldBackgroundColor: Color(0xFFF5DD61),
  barBackgroundColor: Color(0xFF59D5E0),
);

// メロン
const customColorScheme1 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFF2C18D),
  primaryContrastingColor: Color(0xFFF6F193),
  scaffoldBackgroundColor: Color(0xFFC5EBAA),
  barBackgroundColor: Color(0xFFA5DD9B),
);

// スイカ
const customColorScheme2 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF337357),
  primaryContrastingColor: Color(0xFFFFD23F),
  scaffoldBackgroundColor: Color(0xFFEE4266),
  barBackgroundColor: Color(0xFF5E1675),
);

// ピクルス
const customColorScheme3 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF78A083),
  primaryContrastingColor: Color(0xFF50727B),
  scaffoldBackgroundColor: Color(0xFF344955),
  barBackgroundColor: Color(0xFF35374B),
);

// ハロウィン
const customColorScheme4 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF50C4ED),
  primaryContrastingColor: Color(0xFF387ADF),
  scaffoldBackgroundColor: Color.fromARGB(255, 65, 72, 123),
  barBackgroundColor: Color(0xFFFBA834),
);

const customColorScheme5 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF1976D2),
  primaryContrastingColor: Color(0xFF0D47A1),
  scaffoldBackgroundColor: Color(0xFFBBDEFB),
  barBackgroundColor: Color(0xFF64B5F6),
);

const customColorScheme6 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF388E3C),
  primaryContrastingColor: Color(0xFF4CAF50),
  scaffoldBackgroundColor: Color(0xFF689F38),
  barBackgroundColor: Color(0xFF8BC34A),
);

const customColorScheme7 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFE57373),
  primaryContrastingColor: Color(0xFFB71C1C),
  scaffoldBackgroundColor: Color(0xFF880E4F),
  barBackgroundColor: Color(0xFFD32F2F),
);

const customColorScheme8 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFFFD700),
  primaryContrastingColor: Color(0xFFDAA520),
  scaffoldBackgroundColor: Color(0xFFEEE8AA),
  barBackgroundColor: Color.fromARGB(255, 225, 255, 0),
);

const customColorScheme9 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF00FFFF), // Cyan as the primary color
  primaryContrastingColor: Color(0xFF008080), // Dark Cyan as the primary contrasting color
  scaffoldBackgroundColor: Color(0xFFE0FFFF), // Light Cyan as the scaffold background color
  barBackgroundColor: Color(0xFF20B2AA), // Cyan as the bar background color
);

const customColorScheme10 = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFFFCC00), // Pikachu Yellow as the primary color
  primaryContrastingColor: Color(0xFFCC9900), // Dark Pikachu Yellow as the primary contrasting color
  scaffoldBackgroundColor: Color(0xFFFFFACD), // Light Pikachu Yellow as the scaffold background color
  barBackgroundColor: Color.fromARGB(255, 255, 13, 0), // Pikachu Yellow as the bar background color
);

const customColorScheme11 = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF000080), // Blue as the primary contrasting color
  primaryContrastingColor: Color(0xFF000000), // Black as the primary color
  scaffoldBackgroundColor: Color.fromARGB(255, 83, 83, 194), // Navy Blue as the scaffold background color
  barBackgroundColor: Color(0xFF0000CD), // Medium Blue as the bar background color
);
