import 'package:flutter/material.dart';

extension WidgetListExtensions on List<Widget> {
  List<Widget> withBottomSpacing([double height = 100]) {
    return [...this, SizedBox(height: height)];
  }
}
