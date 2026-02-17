import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;
  const NavigationButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(90, 64),
        iconSize: 42,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      child: Icon(iconData),
    );
  }
}
