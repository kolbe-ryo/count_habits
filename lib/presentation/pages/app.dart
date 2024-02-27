import 'package:count_habits/presentation/components/app_loading.dart';
import 'package:count_habits/presentation/pages/color/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/top_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Habits365 extends ConsumerWidget {
  const Habits365({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = ref.watch(colorSchemesProvider);
    return CupertinoApp(
      title: 'Habits365',
      debugShowCheckedModeBanner: false,
      theme: colorScheme,
      home: const TopPage(),
      builder: (_, navigator) {
        return Stack(
          children: [
            navigator!,
            const AppLoading(),
          ],
        );
      },
    );
  }
}
