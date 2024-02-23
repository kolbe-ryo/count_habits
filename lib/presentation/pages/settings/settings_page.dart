import 'package:count_habits/presentation/pages/settings/components/content_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Route<Object?> route() => MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            // leading: IconButton(
            //   icon: const Icon(Icons.arrow_back_ios_new),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            // leading: Icon(CupertinoIcons.back),
            largeTitle: const Text('Settings'),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                // About App
                ContentCard(),
                ContentCard(),
                ContentCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
