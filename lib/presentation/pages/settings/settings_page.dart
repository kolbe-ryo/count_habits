import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/presentation/pages/settings/components/content_card.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.g.dart';
import 'package:count_habits/presentation/pages/theme/text_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static Route<Object?> route() => MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Settings'),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ContentCard(),
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
                              ref.read(appearanceStateProvider.notifier).setColorPalette(index);
                            },
                          ),
                          Text('$index'),
                        ],
                      );
                    },
                  ),
                ),
                const ContentCard(),
                const ContentCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
