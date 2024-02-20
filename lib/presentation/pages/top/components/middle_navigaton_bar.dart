import 'package:count_habits/presentation/pages/top/state/middle_navigation_bar_state.dart';
import 'package:count_habits/util/constants/logger.dart';
import 'package:count_habits/util/constants/specific_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MiddleNavigationBar extends ConsumerWidget {
  const MiddleNavigationBar({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentItem = ref.watch(
      middleNavigationBarStateProvider.select((value) => value.barItemList[index].item),
    );
    logger.i(currentItem);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: BottomNavigationBar(
          backgroundColor: dartColor,
          currentIndex: currentItem,
          enableFeedback: true,
          selectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'CheckIn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Edit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              label: 'Delete',
            ),
          ],
          onTap: (item) => ref.read(middleNavigationBarStateProvider.notifier).changeBarItem(
                index: index,
                item: item,
              ),
        ),
      ),
    );
  }
}