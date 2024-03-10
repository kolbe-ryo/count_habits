import 'package:count_habits/application/usecase/counter/state/counters_provider.dart';
import 'package:count_habits/presentation/components/app_loading.dart';
import 'package:count_habits/presentation/pages/settings/settings_page.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/components/add_new_one_card.dart';
import 'package:count_habits/presentation/pages/top/components/animated_counter.dart';
import 'package:count_habits/presentation/pages/top/components/summary_card.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _pageIndexProvider = StateProvider<int>((ref) => 0);

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    final counters = ref.watch(countersProvider);
    return counters.when(
      data: (data) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            trailing: TextButton(
              onPressed: () => Navigator.of(context).push(SettingsPage.route()),
              child: Text(
                'Setting',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  fontFamily: theme.textTheme.textStyle.fontFamily,
                ),
              ),
            ),
            middle: Text(
              'Habit365',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: theme.textTheme.textStyle.fontFamily,
              ),
            ),
          ),
          child: SafeArea(
            // TODO Textfieldはどうするか？（unFocusできているか実機で確認）
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                final currentScope = FocusScope.of(context);
                if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                  FocusManager.instance.primaryFocus!.unfocus();
                }
              },
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.9),
                      itemCount: data.length + 1,
                      onPageChanged: (index) {
                        if (index == data.length) {
                          // 最後のページ（新規カウント追加）の時は何もしない
                          return;
                        }
                        ref.read(_pageIndexProvider.notifier).state = index;
                      },
                      itemBuilder: (context, index) {
                        if (index == data.length) {
                          return const Column(
                            children: [
                              Expanded(child: SizedBox()),
                              AddNewOneCard(),
                              Expanded(child: SizedBox()),
                            ],
                          );
                        }
                        return Column(
                          children: [
                            const SizedBox(height: 32),
                            SummaryCard(counter: data[index]),
                            const Expanded(child: AnimatedCounter()),
                          ],
                        );
                      },
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: data.length,
                    position: ref.watch(_pageIndexProvider),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stack) {
        Fluttertoast.showToast(
          msg: '読み込みに失敗しました。',
          backgroundColor: theme.primaryColor,
          gravity: ToastGravity.TOP,
          fontSize: 18,
          textColor: Colors.white,
        );
        return const _ReLoadingWidget();
      },
      loading: () => CupertinoPageScaffold(
        child: Stack(
          children: [
            Center(
              // TODO Assetsを設定する
              child: Image.asset('assets/images/image_0.jpg'),
            ),
            const AppLoading(),
          ],
        ),
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
          onPressed: () => ref.invalidate(countersProvider),
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
