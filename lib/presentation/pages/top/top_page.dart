import 'package:count_habits/presentation/pages/top/components/middle_navigation_items.dart';
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
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 32),
                      const SummaryCard(),
                      Expanded(
                        child: MiddleNavigationItems(index),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CupertinoButton(
                            borderRadius: BorderRadius.circular(50),
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Colors.yellow,
                              ),
                              child: const Icon(
                                CupertinoIcons.info,
                                size: 40,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            borderRadius: BorderRadius.circular(50),
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              ),
                              child: const Icon(
                                CupertinoIcons.multiply,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
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
