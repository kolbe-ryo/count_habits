import 'package:count_habits/presentation/pages/top/components/action_button_card.dart';
import 'package:count_habits/presentation/pages/top/components/animated_counter.dart';
import 'package:count_habits/presentation/pages/top/components/summary_card.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO 全体的にCupertinoDesignを適用すること
class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      // backgroundColor: ,
      navigationBar: const CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.add),
        trailing: Icon(CupertinoIcons.settings),
        middle: Text(
          'Habit365',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // TODO: iOS風のScrollを検討する（settingページ参考）
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
