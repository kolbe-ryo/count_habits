import 'package:freezed_annotation/freezed_annotation.dart';

part 'bar_item.freezed.dart';

@freezed
class BarItemList with _$BarItemList {
  const factory BarItemList({
    @Default([]) List<BarItem> barItemList,
  }) = _BarItemList;
}

@freezed
class BarItem with _$BarItem {
  const factory BarItem({
    @Default(0) int index,
    @Default(0) int item,
  }) = _BarItem;
}
