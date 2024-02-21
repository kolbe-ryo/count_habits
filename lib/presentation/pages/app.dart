import 'package:count_habits/presentation/components/app_loading.dart';
import 'package:count_habits/presentation/pages/color/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Habits365 extends ConsumerWidget {
  const Habits365({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemes = ref.watch(colorSchemesProvider);
    return MaterialApp(
      title: 'Habits365',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: colorSchemes.first),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: colorSchemes.last),
      themeMode: ref.watch(themeModeProvider),
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
