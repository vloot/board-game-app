import 'package:flutter/material.dart';

extension WidgetListExtensions on List<Widget> {
  List<Widget> withBottomSpacing([double height = 100]) {
    return [...this, SizedBox(height: height)];
  }
}

extension ReadableTextColor on Color {
  Color get overlayColor {
    return computeLuminance() < 0.4 ? Colors.white : Colors.black;
  }
}
