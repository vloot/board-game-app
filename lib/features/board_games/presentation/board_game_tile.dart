import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:flutter/material.dart';

class BoardGameTile extends StatelessWidget {
  final BoardGameEntity entity;

  const BoardGameTile({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ExpansionTile(
          minTileHeight: 86,
          showTrailingIcon: false,
          shape: const Border(),
          leading: Container(
            // color: Colors.red,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.circle_sharp, color: Color(entity.color)),
                Positioned(
                  bottom: -25,
                  child: Text(entity.playerCount.toString()),
                ),
              ],
            ),
          ),
          title: Text(entity.name),
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
