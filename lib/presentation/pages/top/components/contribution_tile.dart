import 'dart:math' as math;
import 'package:count_habits/presentation/pages/color/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContributionTile extends ConsumerWidget {
  const ContributionTile({super.key});

  List<int> get getCommit {
    final commit = <int>[];
    final dt = DateTime.now();
    final weekDay = dt.weekday + 1;

    for (var i = 0; i < 21 * weekDay; i++) {
      commit.add(math.Random().nextInt(10));
    }

    return commit;
  }

  Color? buildColor(int count, Color color) {
    if (count == 0) {
      return Colors.grey[300];
      // } else if (count <= 2) {
      //   return Colors.green[200];
      // } else if (count <= 4) {
      //   return Colors.green[400];
      // } else if (count <= 6) {
      //   return Colors.green[600];
    } else {
      return color;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commit = getCommit;
    final color = ref.watch(colorSchemesProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 曜日
                  children: [
                    Text('Sun'),
                    Spacer(flex: 2),
                    Text('Tue'),
                    Spacer(flex: 2),
                    Text('Thu'),
                    Spacer(flex: 2),
                    Text('Sat'),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Center(
                  child: GridView.builder(
                    itemCount: commit.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    padding: const EdgeInsets.all(2),
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        decoration: BoxDecoration(
                          color: buildColor(commit[i], color.first.primaryColor),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
