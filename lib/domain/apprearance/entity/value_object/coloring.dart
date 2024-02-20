import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coloring.freezed.dart';

@freezed
class Coloring with _$Coloring {
  const factory Coloring({
    @Default(Colors.green) Color counterColor,
    @Default(Colors.lightGreen) Color counterShadow,
    @Default(Colors.lightGreenAccent) Color contributionColor,
  }) = _Coloring;
}

const colors = {
  0: Coloring(),
  1: Coloring(
    counterColor: Colors.blue,
    counterShadow: Colors.greenAccent,
    contributionColor: Colors.blueAccent,
  ),
  2: Coloring(
    counterColor: Color(0xFF98ABEE),
    counterShadow: Color(0xFF1D24CA),
    contributionColor: Color(0xFF201658),
  ),
  3: Coloring(
    counterColor: Color(0xFFF1FADA),
    counterShadow: Color(0xFF9AD0C2),
    contributionColor: Color(0xFF2D9596),
  ),
  4: Coloring(
    counterColor: Color(0xFFEEA5A6),
    counterShadow: Color(0xFFE493B3),
    contributionColor: Color(0xFFB784B7),
  ),
  5: Coloring(
    counterColor: Color(0xFF9290C3),
    counterShadow: Color(0xFF535C91),
    contributionColor: Color(0xFF1B1A55),
  ),
  6: Coloring(
    counterColor: Color(0xFFF0F3FF),
    counterShadow: Color(0xFF15F5BA),
    contributionColor: Color(0xFF836FFF),
  ),
  7: Coloring(
    counterColor: Color(0xFFEBF400),
    counterShadow: Color(0xFFF57D1F),
    contributionColor: Color(0xFFF72798),
  ),
  8: Coloring(
    counterColor: Color(0xFFB3A398),
    counterShadow: Color(0xFFBBC3A4),
    contributionColor: Color(0xFFC6DCBA),
  ),
  9: Coloring(
    counterColor: Color(0xFFB67352),
    counterShadow: Color(0xFFECB159),
    contributionColor: Color(0xFFFEFBF6),
  ),
  10: Coloring(
    counterColor: Color(0xFFEEEEEE),
    counterShadow: Color(0xFFA3C9AA),
    contributionColor: Color(0xFFC68484),
  ),
  11: Coloring(
    counterColor: Colors.yellow,
    counterShadow: Colors.red,
    contributionColor: Colors.deepOrange,
  ),
};
