import 'package:count_habits/presentation/pages/settings/settings_page.dart';
import 'package:count_habits/presentation/pages/top/components/middle_navigation_items.dart';
import 'package:count_habits/presentation/pages/top/components/middle_navigaton_bar.dart';
import 'package:count_habits/presentation/pages/top/components/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Habit 365',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(SettingsPage.route()),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.9),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SummaryCard(),
                const SizedBox(height: 16),
                MiddleNavigationBar(index: index),
                Expanded(
                  child: MiddleNavigationItems(index),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      // TODO: set Advertising
      bottomNavigationBar: const ColoredBox(
        color: Colors.amberAccent,
        child: SizedBox(
          height: 80,
        ),
      ),
    );
  }
}
