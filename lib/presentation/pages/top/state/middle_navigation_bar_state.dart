import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'middle_navigation_bar_state.g.dart';

@riverpod
class MiddleNavigationBarState extends _$MiddleNavigationBarState {
  @override
  int build() => 0;

  // ignore: avoid_setters_without_getters
  set setIndex(int index) => state = index;
}
