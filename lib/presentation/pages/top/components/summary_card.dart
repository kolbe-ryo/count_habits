import 'package:count_habits/presentation/pages/top/components/contribution_tile.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //　TODO: TextFieldにして編集可能にする
                Text(
                  'Contribution',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.check,
                  // color: Theme.of(context).cupertinoOverrideTheme.primaryColor,
                ),
              ],
            ),
            ContributionTile(),
          ],
        ),
      ),
    );
  }
}
