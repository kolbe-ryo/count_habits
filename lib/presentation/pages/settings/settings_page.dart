import 'package:count_habits/presentation/pages/settings/components/content_card.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static Route<Object?> route() => MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            padding: const EdgeInsetsDirectional.only(start: 1),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(CupertinoIcons.back),
            ),
            largeTitle: Text(
              'Settings',
              style: theme.textTheme.textStyle,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ContentCard(
                    iconData: Icons.rocket_launch,
                    title: 'About App',
                    subTitle: 'アプリの使い方やその他の情報を確認できます',
                  ),
                  const ContentCard(
                    iconData: Icons.badge,
                    title: 'Licenses',
                    subTitle: 'アプリが使用するライセンスを確認できます',
                  ),
                  const ContentCard(
                    iconData: Icons.palette_outlined,
                    title: 'Theme Settings',
                    subTitle: 'カラーやテキストのスタイルを変更できます',
                  ),
                  const ContentCard(
                    iconData: Icons.contact_support_outlined,
                    title: 'Contact Us',
                    subTitle: 'アプリの開発者にコンタクトできます',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
