import 'dart:math' as math;
import 'package:flutter/material.dart';

class ContributionTile extends StatelessWidget {
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

  Color? buildColor(int count) {
    if (count == 0) {
      return Colors.grey[300];
    } else if (count <= 2) {
      return Colors.green[200];
    } else if (count <= 4) {
      return Colors.green[400];
    } else if (count <= 6) {
      return Colors.green[600];
    } else {
      return Colors.green[800];
    }
  }

  @override
  Widget build(BuildContext context) {
    final commit = getCommit;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: 130,
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 曜日
                  children: [
                    Spacer(flex: 3),
                    Text('Mon'),
                    Spacer(flex: 2),
                    Text('Wed'),
                    Spacer(flex: 2),
                    Text('Fri'),
                    Spacer(flex: 3),
                  ],
                ),
              ),
              Expanded(
                flex: 11,
                child: Center(
                  child: GridView.builder(
                    itemCount: commit.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        decoration: BoxDecoration(
                          color: buildColor(commit[i]),
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
