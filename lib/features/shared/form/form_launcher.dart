import 'package:flutter/material.dart';

void openForm(BuildContext context, Widget formWidget) {
  showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) => formWidget,
  );
}
