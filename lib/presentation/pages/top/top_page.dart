import 'package:count_habits/presentation/pages/settings/settings_page.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/components/add_new_one_card.dart';
import 'package:count_habits/presentation/pages/top/components/animated_counter.dart';
import 'package:count_habits/presentation/pages/top/components/summary_card.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);

    // TODO 読み込み完了後に画面表示する
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(SettingsPage.route()),
          icon: const Icon(CupertinoIcons.add),
        ),
        trailing: IconButton(
          onPressed: () => Navigator.of(context).push(SettingsPage.route()),
          icon: const Icon(Icons.settings),
        ),
        middle: Text(
          'Habit365',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: theme.textTheme.textStyle.fontFamily,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (index != 4 - 1) {
                    return Column(
                      children: [
                        const SizedBox(height: 32),
                        SummaryCard(index: index),
                        const Expanded(child: AnimatedCounter()),
                      ],
                    );
                  }
                  return const Column(
                    children: [
                      Expanded(child: SizedBox()),
                      AddNewOneCard(),
                      Expanded(child: SizedBox()),
                    ],
                  );
                },
              ),
            ),
            DotsIndicator(dotsCount: 4),
          ],
        ),
      ),
    );
  }
}
