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
    required this.child,
  });

  factory ContentCard.licenses() {
    return const ContentCard._(
      iconData: Icons.badge,
      title: 'Licenses',
      subTitle: 'アプリが使用するライセンスを確認できます',
      child: LicensePage(),
    );
  }

  final IconData iconData;
  final String title;
  final String subTitle;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoButton(
      onPressed: () => Navigator.of(context).push(
        ThemeSettingPage.route(
          title: title,
          child: child,
        ),
      ),
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
              // 説明文
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
