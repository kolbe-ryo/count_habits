import 'package:count_habits/presentation/pages/settings/components/color_style_button.dart';
import 'package:count_habits/presentation/pages/settings/components/text_style_button.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO レイアウトを調整すること
class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Color',
          style: TextStyle(
            color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          padding: EdgeInsets.zero,
          children: colorSchemes.entries
              .map(
                (e) => ColorStyleButton(
                  theme: e.value,
                  index: e.key,
                ),
              )
              .toList(),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          padding: EdgeInsets.zero,
          children: colorSchemes.entries
              .map(
                (e) => TextStyleButton(index: e.key),
              )
              .toList(),
        ),
      ],
    );
  }
}
