import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/presentation/pages/color/color_schemes.dart';
import 'package:count_habits/presentation/pages/color/color_schemes.g.dart';
import 'package:count_habits/presentation/pages/settings/components/content_card.dart';
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
    final color = ref.watch(colorSchemesProvider);
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
                Wrap(
                  children: List.generate(
                    colorMap.length,
                    (index) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoSwitch(
                            activeColor: color.primaryColor,
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
