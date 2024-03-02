import 'package:count_habits/presentation/pages/settings/theme_setting_page.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentCard extends ConsumerWidget {
  const ContentCard._({
    required this.iconData,
    required this.title,
    required this.subTitle,
    required this.page,
  });

  factory ContentCard.aboutApp() {
    return const ContentCard._(
      iconData: Icons.rocket_launch,
      title: 'About App',
      subTitle: 'アプリの使い方やその他の情報を確認できます',
      page: ThemeSettingPage(
        title: 'About App',
        child: Text('data'),
      ),
    );
  }

  factory ContentCard.themeSetting() {
    return const ContentCard._(
      iconData: Icons.palette_outlined,
      title: 'App Theme',
      subTitle: 'アプリの使い方やその他の情報を確認できます',
      page: ThemeSettingPage(
        title: 'About App',
        child: ThemeSettingForTest(),
      ),
    );
  }

  factory ContentCard.contactUs() {
    return const ContentCard._(
      iconData: Icons.contact_support_outlined,
      title: 'Contact Us',
      subTitle: 'アプリの開発者にコンタクトできます',
      page: ThemeSettingPage(
        title: 'Contact Us',
        child: Text('data'),
      ),
    );
  }

  factory ContentCard.licenses() {
    return const ContentCard._(
      iconData: Icons.badge,
      title: 'Licenses',
      subTitle: 'アプリが使用するライセンスを確認できます',
      page: null,
    );
  }

  final IconData iconData;
  final String title;
  final String subTitle;
  final Widget? page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoButton(
      onPressed: () {
        if (page == null) {
          return showLicensePage(context: context);
        }
        Navigator.of(context).push(
          CupertinoPageRoute<void>(builder: (_) => page!),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Icon(
                iconData,
                size: 48,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: theme.textTheme.textStyle.copyWith(
                  fontSize: 26,
                  color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 18,
                  color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
