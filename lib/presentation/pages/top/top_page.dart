import 'package:count_habits/presentation/pages/top/components/middle_navigation_items.dart';
import 'package:count_habits/presentation/pages/top/components/summary_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO 全体的にCupertinoDesignを適用すること
class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey.withOpacity(0.5),
        middle: const Text('Habit365'),
      ),
      child: SafeArea(
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.9),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 16),
                const SummaryCard(),
                const SizedBox(height: 16),
                MiddleNavigationItems(index),
                const SizedBox(height: 100),
              ],
            );
          },
        ),
      ),
    );
  }
}
