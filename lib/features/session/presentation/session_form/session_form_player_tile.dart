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
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(
              appDataCubit.state.playersById[sessionPlayer.playerId]!.color,
            ).withAlpha(128),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Color(
                appDataCubit.state.playersById[sessionPlayer.playerId]!.color,
              ),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('${index + 1}', textAlign: TextAlign.end),
                  ),
                  Text(
                    appDataCubit
                        .state
                        .playersById[sessionPlayer.playerId]!
                        .name,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                enableScoring
                    ? Container(
                        width: 40,
                        height: 35,
                        alignment: Alignment.center,
                        child: TextFormField(
                          focusNode: focusNode,
                          controller: controller,
                          onChanged: (value) =>
                              sessionPlayer.score = int.tryParse(value) ?? 0,
                          selectAllOnFocus: true,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          clipBehavior: Clip.hardEdge,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: controller.text.isEmpty
                                    ? Colors.black45
                                    : Colors.transparent,
                              ),
                            ),
                            focusedBorder: InputBorder.none,
                            // border: InputBorder.none,
                          ),
                        ),
                      )
                    : SizedBox(),
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
