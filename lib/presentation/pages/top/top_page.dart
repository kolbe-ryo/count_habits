import 'package:count_habits/presentation/pages/top/components/middle_navigaton_bar.dart';
import 'package:count_habits/presentation/pages/top/components/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // TODO: settng系
      appBar: AppBar(),
      body: SafeArea(
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.9),
          itemCount: 4,
          itemBuilder: (context, item) {
            return const Column(
              children: [
                SummaryCard(),
                SizedBox(height: 16),
                MiddleNavigationBar(),
              ],
            );
          },
        ),
      ),
    );
  }
}
