import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<Object?> route() => MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // About App
          SizedBox(),
        ],
      ),
    );
  }
}
