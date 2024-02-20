import 'package:count_habits/domain/exception/app_exception.dart';
import 'package:count_habits/domain/exception/app_exception_enum.dart';
import 'package:count_habits/presentation/pages/top/components/animated_counter.dart';
import 'package:count_habits/presentation/pages/top/components/edit_counter.dart';
import 'package:count_habits/presentation/pages/top/state/middle_navigation_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MiddleNavigationItems extends ConsumerWidget {
  const MiddleNavigationItems(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(
      middleNavigationBarStateProvider.select((value) => value.barItemList[index].item),
    );
    switch (item) {
      case 0:
        return const AnimatedCounter();
      case 1:
        return const EditCounter();
      default:
        throw const AppException(AppExceptionEnum.unexpectedException);
    }
  }
}
