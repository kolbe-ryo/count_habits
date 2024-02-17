import 'package:count_habits/presentation/pages/detail/detail_page.dart';
import 'package:count_habits/presentation/pages/top/components/contribution_tile.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(DetailPage.route()),
      child: Card(
        // color: Colors.blueGrey,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.warning),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'You have 3 tasks to complete today',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              ContributionTile(),
            ],
          ),
        ),
      ),
    );
  }
}
