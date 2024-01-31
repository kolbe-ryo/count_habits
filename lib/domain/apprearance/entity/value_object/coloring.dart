import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coloring.freezed.dart';

@freezed
class Coloring with _$Coloring {
  const factory Coloring({
    @Default(Colors.yellow) Color counterColor,
    @Default(Colors.red) Color counterShadow,
    @Default(Colors.deepOrange) Color contributionColor,
  }) = _Coloring;
}

const colors = {
  0: Coloring(),
  1: Coloring(
    counterColor: Colors.blue,
    counterShadow: Colors.greenAccent,
    contributionColor: Colors.blueAccent,
  ),
  // TODO: バリエーションを増やすこと
};
