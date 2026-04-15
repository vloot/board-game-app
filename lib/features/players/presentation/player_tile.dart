import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_event.dart';
import 'package:board_game_app/features/players/presentation/form/player_form.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/confirmation_dialog/confirmation_dialog.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:board_game_app/features/shared/form/modal_form.dart';
import 'package:board_game_app/features/shared/slidable/pop_action_controller.dart';
import 'package:board_game_app/features/shared/slidable_tile/slidable_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerTile extends StatelessWidget {
  final PlayerEntity playerEntity;
  final PopActionController popActionController;
  const PlayerTile(this.playerEntity, this.popActionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableTile(
      popActionController: popActionController,
      shadowColor: Color(playerEntity.color),
      height: 70,
      vPadding: 11,
      child: ListTile(
        leading: Icon(Icons.circle_sharp, color: Color(playerEntity.color)),
        title: Text(playerEntity.name),
      ),
      onEdit: () {
        openForm(
          context,
          PlayerForm(
            formAction: FormAction.edit,
            settingsState: context.read<AppSettingsBloc>().state,
            preloadedPlayerEntity: playerEntity,
          ),
        );
      },
      onDelete: () {
        final bloc = context.read<PlayerBloc>();
        showDeleteSheet(context).then((value) {
          if (value) {
            bloc.add(DeletePlayer(playerEntity.id));
          }
        });
      },
    );
  }
}
