import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/form/board_game_form.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/confirmation_dialog/confirmation_dialog.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:board_game_app/features/shared/slidable/pop_action_controller.dart';
import 'package:board_game_app/features/shared/slidable_tile/slidable_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardGameTile extends StatelessWidget {
  final BoardGameEntity entity;
  final PopActionController popActionController;
  const BoardGameTile({
    super.key,
    required this.popActionController,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    final settingsState = context.read<AppSettingsBloc>().state;
    return SlidableTile(
      popActionController: popActionController,
      vPadding: 20,
      shadowColor: Color(entity.color),
      height: 90,
      onEdit: () {
        openForm(
          context,
          BoardGameForm(settingsState: settingsState, boardGame: entity),
        );
      },
      onDelete: () {
        final bloc = context.read<BoardGameBloc>();
        showDeleteSheet(context).then((value) {
          if (value) {
            bloc.add(DeleteBoardGame(entity));
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle_sharp,
                  color: Color(entity.color),
                  shadows: const [
                    Shadow(
                      color: Colors.blueGrey,
                      blurRadius: 0.8,
                      offset: Offset(0, 0.5),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      entity.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(settingsState.settings.theme.textColor),
                      ),
                    ),
                    Positioned(
                      bottom: -18,
                      left: -42,
                      child: Row(
                        children: entity.playerCount.isFilled()
                            ? [
                                Icon(
                                  Icons.person_2_sharp,
                                  size: 10,
                                  color: Color(
                                    settingsState.settings.theme.textColor,
                                  ).withAlpha(240),
                                ),
                                Text(
                                  '${entity.playerCount}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(
                                      settingsState.settings.theme.textColor,
                                    ).withAlpha(240),
                                  ),
                                ),
                              ]
                            : [],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // TODO implement image for BG card
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
