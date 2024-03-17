import 'package:count_habits/presentation/pages/settings/components/color_style_button.dart';
import 'package:count_habits/presentation/pages/settings/components/text_style_button.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            padding: const EdgeInsetsDirectional.only(start: 1),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(CupertinoIcons.back),
            ),
            largeTitle: Text(
              'Theme',
              style: theme.textTheme.textStyle,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Color',
                style: theme.textTheme.textStyle.copyWith(
                  fontSize: 26,
                  color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: colorSchemes.entries
                  .map(
                    (e) => ColorStyleButton(
                      theme: e.value,
                      index: e.key,
                    ),
                  )
                  .toList(),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: colorSchemes.entries
                .map(
                  (e) => TextStyleButton(index: e.key),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
