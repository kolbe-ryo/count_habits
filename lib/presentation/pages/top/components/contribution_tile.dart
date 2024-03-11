import 'package:count_habits/domain/counter/entity/value_object/contribution.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContributionTile extends ConsumerWidget {
  const ContributionTile({
    required this.contribution,
    super.key,
  });

  final Contribution contribution;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    final getAllDates = contribution.getAllDates;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              Expanded(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                  ),
                  child: const Column(
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
              ),
              Expanded(
                flex: 8,
                child: Center(
                  child: GridView.builder(
                    itemCount: getAllDates.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    padding: const EdgeInsets.all(2),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: getAllDates[index] ? theme.primaryColor : Colors.grey[300],
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
