import 'package:count_habits/presentation/pages/top/components/contribution_tile.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey, // Changed color to yellow
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children to the start and end
            children: [
              Text(
                'Summary',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.warning), // Added exclamation mark icon next to the title
            ],
          ),
          SizedBox(height: 16),
          Text(
            'You have 3 tasks to complete today',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          ContributionTile(),
        ],
      ),
    );
  }
}
