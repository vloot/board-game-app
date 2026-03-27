import 'package:board_game_app/features/session/domain/session_player_entity.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroke_text/stroke_text.dart';

class SessionFormPlayerTile extends StatelessWidget {
  const SessionFormPlayerTile(
    this.index, {
    super.key,
    required this.sessionPlayer,
    required this.onRemove,
    required this.controller,
    required this.focusNode,
  });

  final SessionPlayerEntity sessionPlayer;
  final int index;
  final void Function() onRemove;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final appDataCubit = context.read<AppDataCubit>();
    return Padding(
      // key:
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: Color(
              appDataCubit.state.playersById[sessionPlayer.playerId]!.color,
            ),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlaceIcon(index),
            Text(appDataCubit.state.playersById[sessionPlayer.playerId]!.name),
            Row(
              children: [
                SizedBox(
                  width: 75,
                  child: TextFormField(
                    focusNode: focusNode,
                    controller: controller,
                    selectAllOnFocus: true,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.top,
                    clipBehavior: Clip.hardEdge,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onRemove,
                  icon: Icon(Icons.remove_circle_sharp, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceIcon extends StatelessWidget {
  final int index;
  const PlaceIcon(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 40,
      child: Stack(
        children: [
          Icon(
            Icons.emoji_events_sharp,
            color: index == 0 ? Colors.amber : Colors.black26,
            size: 40,
          ),
          Positioned(
            top: 4,
            left: 15,
            child: SizedBox(
              width: 30,
              child: StrokeText(
                text: '${index + 1}',
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                strokeColor: Colors.black,
                strokeWidth: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
