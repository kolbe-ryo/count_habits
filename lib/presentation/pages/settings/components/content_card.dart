import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/util/constants/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentCard extends ConsumerWidget {
  const ContentCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return GestureDetector(
      onTap: () {
        logger.i('tap');
      },
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.4,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        decoration: BoxDecoration(
          // color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: const [
          //   BoxShadow(
          //     blurRadius: 10,
          //     offset: Offset(-10, -10),
          //     // color: Colors.white24,
          //   ),
          //   BoxShadow(
          //     blurRadius: 10,
          //     offset: Offset(10, 10),
          //     // color: Colors.grey,
          //   ),
          // ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const Icon(
                Icons.rocket_launch,
                size: 48,
              ),
              const SizedBox(height: 8),
              Text(
                'タイトル',
                style: theme.textTheme.textStyle.copyWith(
                  fontSize: 26,
                  color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              // 説明文
              Text(
                'ここに説明文が入ります。ここに説明文が入ります。ここに説明文が入ります。',
                style: TextStyle(
                  fontSize: 20,
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
