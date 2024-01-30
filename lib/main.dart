import 'package:count_habits/presentation/pages/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Habits365());
}

class Habits365 extends StatelessWidget {
  const Habits365({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: App(),
    );
  }
}
