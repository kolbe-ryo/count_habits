import 'package:count_habits/presentation/pages/top/state/value_object/bar_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'middle_navigation_bar_state.g.dart';

@riverpod
class MiddleNavigationBarState extends _$MiddleNavigationBarState {
  @override
  // TODO: データ数を元にこちらのproviderを生成する
  // List<int> build() => ref.watch(provider);
  BarItemList build() {
    final initialList = List.generate(4, (index) => BarItem(index: index));
    return BarItemList(barItemList: initialList);
  }

  void changeBarItem({
    required int index,
    required int item,
  }) {
    final newList = state.barItemList
        .map(
          (e) => e.index == index
              ? BarItem(
                  index: index,
                  item: item,
                )
              : e,
        )
        .toList();
    state = state.copyWith(barItemList: newList);
  }
}
