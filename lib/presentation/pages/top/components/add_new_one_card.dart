import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewOneCard extends ConsumerWidget {
  const AddNewOneCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey.withOpacity(0.5),
      child: Column(
        children: [
          Text('Title'),
          Text('Subtitle'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Button'),
          ),
        ],
      ),
    );
  }
}
