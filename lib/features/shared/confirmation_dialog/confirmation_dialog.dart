import 'dart:io' show Platform;
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteSheet(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;

  if (Platform.isIOS) {
    final result = await showCupertinoModalPopup<bool>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(l10n.deleteTitle),
        message: Text(l10n.deleteDescr),
        actions: [
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.delete),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.cancel),
        ),
      ),
    );

    return result ?? false;
  }

  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.deleteTitle),
      content: Text(l10n.deleteDescr),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(l10n.delete),
        ),
      ],
    ),
  );

  return result ?? false;
}
