import 'package:count_habits/presentation/pages/settings/settings_page.dart';
import 'package:count_habits/presentation/pages/top/components/action_button_card.dart';
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
        middle: const Text(
          'Habit365',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
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
                  return const Column(
                    children: [
                      SizedBox(height: 32),
                      SummaryCard(),
                      Expanded(child: AnimatedCounter()),
                      ActionButtonCard(),
                      SizedBox(height: 32),
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
