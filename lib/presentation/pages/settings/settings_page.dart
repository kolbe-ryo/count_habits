import 'package:count_habits/presentation/pages/settings/components/content_card.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<Object?> route() => MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            // About App
            ContentCard(),
            ContentCard(),
            ContentCard(),
          ],
        ),
      ),
    );
  }
}
