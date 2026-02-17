import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_event.dart';
import 'package:board_game_app/features/players/presentation/players_page.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/modal_form.dart';
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
          SlidableAction(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            onPressed: (context) {
              context.read<PlayerBloc>().add(DeletePlayer(_playerEntity.id));
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete_sharp,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              openPlayerForm(
                context,
                FormAction.edit,
                context.read<AppSettingsBloc>().state,
                playerEntity: _playerEntity,
              );
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit_sharp,
            label: 'Edit',
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
