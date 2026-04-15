import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_popup/flutter_popup.dart';

class ColorPopup extends StatefulWidget {
  final void Function(Color value) onColorChanged;
  final Color startingColor;

  const ColorPopup({
    super.key,
    required this.startingColor,
    required this.onColorChanged,
  });

  @override
  _ColorPopupState createState() => _ColorPopupState();
}

class _ColorPopupState extends State<ColorPopup> {
  late Color bgColor;

  @override
  void initState() {
    super.initState();
    bgColor = widget.startingColor;
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      contentDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(500),
          bottom: Radius.circular(100),
        ),
        boxShadow: List.empty(),
      ),
      // backgroundColor: Colors.transparent,
      // barrierColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(500),
            bottom: Radius.circular(100),
          ),
        ),
        height: 370,
        width: 285,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  child: HueRingPicker(
                    pickerColor: bgColor,
                    onColorChanged: (value) {
                      bgColor = value;
                      widget.onColorChanged(value);
                    },
                    enableAlpha: false,
                    displayThumbColor: false,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(width: 420, height: 75, color: Colors.white),
                ),
                Positioned(
                  right: 45,
                  left: 45,
                  bottom: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Text(AppLocalizations.of(context)!.pick),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      child: Icon(Icons.circle_sharp, color: bgColor),
    );
  }
}
