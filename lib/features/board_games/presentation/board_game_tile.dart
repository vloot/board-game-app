import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/form/board_game_form.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/confirmation_dialog/confirmation_dialog.dart';
import 'package:board_game_app/features/shared/slidable/circular_slidable_action.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:board_game_app/features/shared/slidable/pop_action_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BoardGameTile extends StatefulWidget {
  final BoardGameEntity entity;
  final PopActionController popActionController;

  const BoardGameTile({
    super.key,
    required this.entity,
    required this.popActionController,
  });

  @override
  State<BoardGameTile> createState() => _BoardGameTileState();
}

class _BoardGameTileState extends State<BoardGameTile>
    with SingleTickerProviderStateMixin {
  late final SlidableController controller;
  late final VoidCallback _closeAction;

  @override
  void initState() {
    super.initState();
    controller = SlidableController(this);

    _closeAction = () {
      controller.close();
    };

    widget.popActionController.add(_closeAction);
  }

  @override
  void dispose() {
    widget.popActionController.remove(_closeAction);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entity = widget.entity;

    return Slidable(
      controller: controller,
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const DrawerMotion(),
        children: [
          CircularSlidableAction(
            bgColor: Colors.blueAccent,
            iconColor: Colors.white,
            iconData: Icons.edit_sharp,
            onPressed: () {
              controller.close();
              openForm(
                context,
                BoardGameForm(
                  settingsState: context.read<AppSettingsBloc>().state,
                  boardGame: entity,
                ),
              );
            },
            vPadding: 20,
          ),
          CircularSlidableAction(
            bgColor: Colors.red,
            iconColor: Colors.white,
            iconData: Icons.delete_forever_sharp,
            onPressed: () {
              final bloc = context.read<BoardGameBloc>();
              controller.close();
              showDeleteSheet(context).then((value) {
                if (value) {
                  bloc.add(DeleteBoardGame(entity));
                  controller.close();
                }
              });
            },

            vPadding: 20,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Card(
          shadowColor: Color(entity.color),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            width: double.infinity,
            height: 75,
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
                        Text(entity.name, style: const TextStyle(fontSize: 16)),
                        Positioned(
                          bottom: -18,
                          left: -42,
                          child: Row(
                            children: entity.playerCount.isFilled()
                                ? [
                                    const Icon(
                                      Icons.person_2_sharp,
                                      size: 10,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      '${entity.playerCount}',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black87,
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
        ),
      ),
    );
  }
}
