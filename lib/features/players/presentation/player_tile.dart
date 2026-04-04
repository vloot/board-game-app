import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_event.dart';
import 'package:board_game_app/features/players/presentation/form/player_form.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:board_game_app/features/shared/form/modal_form.dart';
import 'package:board_game_app/features/shared/circular_slidable_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PlayerTile extends StatelessWidget {
  final PlayerEntity _playerEntity;
  const PlayerTile(this._playerEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.33,
        motion: const DrawerMotion(),
        children: [
          CircularSlidableAction(
            bgColor: Colors.red,
            iconColor: Colors.white,
            iconData: Icons.delete_forever_sharp,
            onPressed: () =>
                context.read<PlayerBloc>().add(DeletePlayer(_playerEntity.id)),
          ),
          CircularSlidableAction(
            bgColor: Colors.blueAccent,
            iconColor: Colors.white,
            iconData: Icons.edit_sharp,
            onPressed: () {
              openForm(
                context,
                PlayerForm(
                  formAction: FormAction.edit,
                  settingsState: context.read<AppSettingsBloc>().state,
                  preloadedPlayerEntity: _playerEntity,
                ),
              );
            },
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black26,
          ),
          child: ListTile(
            leading: Icon(
              Icons.circle_sharp,
              color: Color(_playerEntity.color),
            ),
            title: Text(_playerEntity.name),
          ),
        ),
      ),
    );
  }
}
