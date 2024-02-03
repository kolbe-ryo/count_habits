import 'package:count_habits/presentation/components/app_loading.dart';
import 'package:count_habits/presentation/pages/top/top_page.dart';
import 'package:flutter/material.dart';

class Habits365 extends StatelessWidget {
  const Habits365({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habits365',
      debugShowCheckedModeBanner: false,
      // TODO: Theme setting
      theme: ThemeData(),
      home: const TopPage(),
      builder: (_, navigator) {
        return Stack(
          children: [
            navigator!,
            const AppLoading(),
          ],
        );
      },
    );
  }
}
