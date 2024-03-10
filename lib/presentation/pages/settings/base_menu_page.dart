import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseMenuPage extends ConsumerWidget {
  const BaseMenuPage({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

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
              title,
              style: theme.textTheme.textStyle,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [child],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
