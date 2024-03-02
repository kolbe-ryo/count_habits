import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.g.dart';
import 'package:count_habits/presentation/pages/theme/text_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoPageScaffold(
      child: Column(
        children: [
          const Text(
            'Color',
            style: TextStyle(fontSize: 30),
          ),
          Wrap(
            children: List.generate(
              colorSchemes.length,
              (index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoSwitch(
                      activeColor: theme.primaryColor,
                      value: index == ref.watch(appearanceStateProvider.select((value) => value.colorId)),
                      onChanged: (value) {
                        ref.read(appearanceStateProvider.notifier).setColorPalette(index);
                      },
                    ),
                    Text('$index'),
                  ],
                );
              },
            ),
          ),
          const Text(
            'Text',
            style: TextStyle(fontSize: 30),
          ),
          Wrap(
            children: List.generate(
              textSchemes.length,
              (index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoSwitch(
                      activeColor: theme.primaryColor,
                      value: index == ref.watch(appearanceStateProvider.select((value) => value.fontFamilyId)),
                      onChanged: (value) {
                        ref.read(appearanceStateProvider.notifier).setFontFamily(index);
                      },
                    ),
                    Text('$index'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
