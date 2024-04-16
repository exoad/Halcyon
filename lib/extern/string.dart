import 'package:flutter/material.dart';
import 'package:halcyon/util/color.dart';

extension H_String on String {
  String repeat(int n) => List<String>.filled(n, this).join("");

  /// [HELLA FUCKING DANGEROUS METHOD TO CALL]
  Color get coerceToColorObj => HexColor.fromHexString(this);
}
