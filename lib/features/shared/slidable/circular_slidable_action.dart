import 'package:flutter/material.dart';

class CircularSlidableAction extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;

  final IconData iconData;
  final Function() onPressed;

  final double vPadding;

  const CircularSlidableAction({
    super.key,
    required this.bgColor,
    required this.iconColor,
    required this.iconData,
    required this.onPressed,
    this.vPadding = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: vPadding),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: SizedBox(
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(iconData),
              iconSize: 27,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
