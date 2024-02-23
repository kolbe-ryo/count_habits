import 'package:count_habits/presentation/components/app_dialog.dart';
import 'package:count_habits/presentation/pages/top/state/middle_navigation_bar_state.dart';
import 'package:count_habits/util/constants/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MiddleNavigationBar extends ConsumerWidget {
  const MiddleNavigationBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentItem = ref.watch(
      middleNavigationBarStateProvider.select((value) => value[index].item),
    );
    logger.i(currentItem);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: NavigationBar(
          height: 30,
          selectedIndex: currentItem,
          elevation: 20,
          destinations: const [
            // BottomNavigationBarItem(
            Icon(Icons.check),
            //   label: 'CheckIn',
            // ),
            // BottomNavigationBarItem(
            Icon(Icons.delete),
            //   label: 'Delete',
            // ),
          ],
          onDestinationSelected: (item) async {
            // Deleteはdialogで処理する
            if (item == 1) {
              final result = await showCustomDialog(context) ?? false;
              if (result) {
                // TODO Delete処理
              }
              return;
            }
            ref.read(middleNavigationBarStateProvider.notifier).changeBarItem(
                  index: index,
                  item: item,
                );
          },
        ),
      ),
    );
  }
}
