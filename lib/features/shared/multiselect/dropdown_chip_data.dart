import 'package:flutter/material.dart';

class DropdownChipData<T> {
  final String label;
  final Color color;
  final T chipValue;

  DropdownChipData({
    required this.label,
    required this.color,
    required this.chipValue,
  });
}
