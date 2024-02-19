import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'middle_navigation_bar_state.g.dart';

@riverpod
class MiddleNavigationBarState extends _$MiddleNavigationBarState {
  @override
  List<int> build() => [];

  void changeBarItem({
    required int index,
    required int item,
  }) =>
      state[index] = item;
}
