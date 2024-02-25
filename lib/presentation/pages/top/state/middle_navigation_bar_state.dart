import 'package:count_habits/presentation/pages/top/state/value_object/bar_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'middle_navigation_bar_state.g.dart';

@riverpod
class MiddleNavigationBarState extends _$MiddleNavigationBarState {
  @override
  // TODO: データ数を元にこちらのproviderを生成する
  // THINK: もしかするとindex管理は不要かもしれない
  // List<int> build() => ref.watch(provider);
  List<BarItem> build() => List.generate(4, (index) => BarItem(index: index));

  /// Changes the item at the specified index in the middle navigation bar.
  ///
  /// [index]: The index of the Counter
  /// [item]: The middle navigation bar item
  void changeBarItem({
    required int index,
    required int item,
  }) {
    final newList = state
        .map(
          (e) => e.index == index
              ? BarItem(
                  index: index,
                  item: item,
                )
              : e,
        )
        .toList();
    state = newList;
  }
}
