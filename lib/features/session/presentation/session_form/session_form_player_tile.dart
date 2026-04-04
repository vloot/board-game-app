import 'package:board_game_app/features/session/domain/session_player_entity.dart';
import 'package:board_game_app/features/session/presentation/session_form/cubit/session_form_cubit.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionFormPlayerTile extends StatelessWidget {
  const SessionFormPlayerTile(
    this.index, {
    super.key,
    required this.sessionPlayer,
    required this.onRemove,
    required this.controller,
    required this.focusNode,
    required this.enableScoring,
  });

  final SessionPlayerEntity sessionPlayer;
  final int index;
  final bool enableScoring;
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
            Text('${index + 1}'),
            Text(appDataCubit.state.playersById[sessionPlayer.playerId]!.name),
            Row(
              children: [
                PlaceIcon(
                  isWinner: sessionPlayer.isWinner,
                  onPressed: () {
                    sessionPlayer.isWinner ^= true;
                    context
                        .read<SessionFormCubit>()
                        .updateSessinPlayerWinStatus(
                          sessionPlayer.playerId,
                          sessionPlayer.isWinner,
                        );
                  },
                ),
                SizedBox(
                  width: 75,
                  child: enableScoring
                      ? TextFormField(
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
                        )
                      : Spacer(),
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
  final void Function() onPressed;
  final bool isWinner;

  const PlaceIcon({super.key, required this.onPressed, required this.isWinner});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 40,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.emoji_events_sharp,
          color: isWinner ? Colors.amberAccent : Colors.grey,
        ),
      ),
    );
  }
}
