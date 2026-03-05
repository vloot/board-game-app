import 'package:flutter/material.dart';

void openForm(BuildContext context, Widget formWidget) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (builderContext) {
      return formWidget;
    },
  );
}
