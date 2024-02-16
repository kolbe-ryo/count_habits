import 'package:count_habits/presentation/pages/top/components/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 4,
          itemBuilder: (context, item) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SummaryCard(),
            );
          },
        ),
      ),
    );
  }
}
