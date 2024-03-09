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
            leading: IconButton(
              onPressed: () => Navigator.of(context).push(SettingsPage.route()),
              icon: const Icon(CupertinoIcons.add),
            ),
            trailing: IconButton(
              onPressed: () => Navigator.of(context).push(SettingsPage.route()),
              icon: const Icon(Icons.settings),
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
                    itemCount: data.length + 1,
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
                DotsIndicator(dotsCount: 4),
              ],
            ),
          ),
        );
      },
      error: (error, stack) {
        Fluttertoast.showToast(msg: '読み込みに失敗しました。');
        return CupertinoButton(
          color: theme.barBackgroundColor,
          // TODO 追加処理
          onPressed: () {},
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
        );
      },
      loading: () => const AppLoading(),
    );
  }
}
