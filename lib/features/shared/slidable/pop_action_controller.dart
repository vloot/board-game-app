import 'package:flutter/material.dart';

class PopActionController {
  final Set<VoidCallback> _actions = {};

  void add(VoidCallback action) {
    _actions.add(action);
  }

  void remove(VoidCallback action) {
    _actions.remove(action);
  }

  /// returns true if handled (consumed back press)
  bool handlePop() {
    if (_actions.isNotEmpty) {
      for (final a in List.of(_actions)) {
        a();
      }
      _actions.clear();
      return true;
    }
    return false;
  }
}
