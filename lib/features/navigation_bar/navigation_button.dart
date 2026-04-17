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
        fixedSize: const Size(64, 64),
        iconSize: 42,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
      ),
      child: Icon(iconData),
    );
  }
}
