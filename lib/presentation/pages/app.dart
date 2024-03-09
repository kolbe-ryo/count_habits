import 'package:count_habits/application/state/loading_state_provider.dart';
import 'package:count_habits/presentation/components/app_loading.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/top_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Habits365 extends ConsumerWidget {
  const Habits365({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);
    return CupertinoApp(
      title: 'Habits365',
      debugShowCheckedModeBanner: false,
      theme: cupertinoTheme,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: const TopPage(),
      // homeをchildとして引き継いで、ローディング状態の時のみローディングをスタックする画面表示などが可能
      builder: (_, child) => Consumer(
        builder: (context, ref, _) {
          final isLoading = ref.watch(loadingStateProvider);
          return Stack(
            children: [
              child!,
              // ローディング表示
              if (isLoading) const AppLoading(),
            ],
          );
        },
      ),
    );
  }
}
