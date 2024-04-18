import 'dart:math';

import 'package:count_habits/application/state/initial_data_provider.dart';
import 'package:count_habits/application/usecase/counter/state/counters_provider.dart';
import 'package:count_habits/gen/assets.gen.dart';
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
    final initialData = ref.watch(initialDataProvider);
    return initialData.when(
      data: (data) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              trailing: TextButton(
                onPressed: () => Navigator.of(context).push(SettingsPage.route()),
                child: Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 16,
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
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.9),
                      itemCount: data.counters.length + 1,
                      onPageChanged: (index) {
                        // if (index == data.counters.length) {
                        //   // 最後のページ（新規カウント追加）の時は何もしない
                        //   return;
                        // }
                        ref.read(_pageIndexProvider.notifier).state = index;
                      },
                      itemBuilder: (context, index) {
                        if (index == data.counters.length) {
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
                            SummaryCard(counter: data.counters[index]),
                            Expanded(
                              child: AnimatedCounter(counter: data.counters[index]),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: data.counters.length + 1,
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
      loading: () {
        final images = Assets.images.values;
        final randomImage = images[Random().nextInt(images.length)];
        return CupertinoPageScaffold(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(randomImage.path),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: AppLoading(),
            ),
          ),
        );
      },
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
