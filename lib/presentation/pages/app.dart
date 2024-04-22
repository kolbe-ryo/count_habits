import 'package:count_habits/application/state/loading_state_provider.dart';
import 'package:count_habits/application/usecase/appearance/state/appearance_provider.dart';
import 'package:count_habits/presentation/components/app_loading.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/top_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Habits365 extends ConsumerWidget {
  const Habits365({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);
    final appearance = ref.watch(appearanceProvider);
    // TODO ここの作りの再検討（when二段は変に見える）
    return appearance.when(
      data: (data) {
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
      },
      error: (error, stack) {
        Fluttertoast.showToast(
          msg: '読み込みに失敗しました。',
          backgroundColor: cupertinoTheme.primaryColor,
          gravity: ToastGravity.TOP,
          fontSize: 18,
          textColor: Colors.white,
        );
        return const _ReLoadingWidget();
      },
      loading: () => const Center(
        child: AppLoading(),
      ),
    );
  }
}

class _ReLoadingWidget extends ConsumerWidget {
  const _ReLoadingWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          color: theme.barBackgroundColor,
          onPressed: () => ref.invalidate(appearanceProvider),
          borderRadius: BorderRadius.circular(10),
          child: Text(
            '再読み込み',
            style: TextStyle(
              color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: theme.textTheme.textStyle.fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
