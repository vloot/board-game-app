import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final List<NavigationButton> buttons;
  const CustomNavBar({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.blueGrey.withAlpha(164),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      ),
    );
  }
}
