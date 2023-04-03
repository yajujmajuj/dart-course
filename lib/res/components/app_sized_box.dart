import 'package:flutter/material.dart';

extension PaddingHeight on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

responsiveHorizontalCavity(double size) {
  return SizedBox(
    width: size,
  );
}

responsiveVerticalCavity(double size) {
  return SizedBox(
    height: size,
  );
}
// displayHeight(context),
//     displayWidth(context),
