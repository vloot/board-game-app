import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final List<NavigationButton> buttons;
  const CustomNavBar({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          width: buttons.length * 120,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: Colors.blueGrey.withAlpha(0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buttons,
          ),
        ),
      ),
    );
  }
}
