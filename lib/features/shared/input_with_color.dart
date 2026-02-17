import 'dart:math';

import 'package:board_game_app/features/board_games/presentation/form/color_popup.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:flutter/material.dart';

class InputWithColor extends StatefulWidget {
  final String labelText;
  final TextEditingController textController;
  final AppSettingsState settingsState;

  final String? preloadedValue;
  final Color? preloadedColor;

  final void Function(Color color) onColorPicked;

  const InputWithColor({
    super.key,
    required this.textController,
    required this.settingsState,
    required this.onColorPicked,
    required this.labelText,
    this.preloadedValue,
    this.preloadedColor,
  });

  @override
  _InputWithColorState createState() => _InputWithColorState();
}

class _InputWithColorState extends State<InputWithColor> {
  Color bgColor = Colors.white;

  @override
  void initState() {
    super.initState();
    bgColor =
        widget.preloadedColor ??
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withAlpha(255);
    widget.onColorPicked(bgColor);
    widget.textController.text = widget.preloadedValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 400,
      child: Stack(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.trim().length <= 1) {
                return 'Enter a valid name';
              }
              return null;
            },
            autofocus: true,
            controller: widget.textController,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: Color(widget.settingsState.settings.theme.textColor),
                fontSize: 18,
              ),
              hintFadeDuration: Duration(seconds: 1),
              contentPadding: EdgeInsets.fromLTRB(12, 16, 42, 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(
                    widget.settingsState.settings.theme.primaryColorAccent,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 0,
            bottom: 0,
            child: ColorPopup(
              startingColor: bgColor,
              onColorChanged: (value) {
                bgColor = value;
                widget.onColorPicked(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
