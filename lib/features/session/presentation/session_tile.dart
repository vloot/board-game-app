import 'package:board_game_app/features/session/domain/session_entity.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_bloc.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_event.dart';
import 'package:board_game_app/features/session/presentation/session_form/session_form.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/confirmation_dialog/confirmation_dialog.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:board_game_app/features/shared/slidable/pop_action_controller.dart';
import 'package:board_game_app/features/shared/slidable_tile/slidable_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionTile extends StatelessWidget {
  const SessionTile({
    super.key,
    required this.popActionController,
    required this.appDataState,
    required this.playerChips,
    required this.sessionEntity,
  });

  final PopActionController popActionController;
  final AppDataState appDataState;
  final List<Widget> playerChips;
  final SessionEntity sessionEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SlidableTile(
        height: 100,
        vPadding: 26.5,
        popActionController: popActionController,
        onEdit: () {
          final bloc = context.read<SessionsBloc>();
          // bloc.add(EditSession(sessionEntity));
          openForm(
            context,
            SessionForm(
              settingsState: context.read<AppSettingsBloc>().state,
              sessionsBloc: bloc,
              sessionEntity: sessionEntity,
            ),
          );
        },
        onDelete: () {
          final bloc = context.read<SessionsBloc>();
          showDeleteSheet(context).then((value) {
            if (value) {
              bloc.add(DeleteSession(sessionEntity.id!));
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appDataState.gamesById[sessionEntity.boardGameId]!.name,
                style: TextStyle(
                  color: Color(
                    context
                        .read<AppSettingsBloc>()
                        .state
                        .settings
                        .theme
                        .textColor,
                  ),
                ),
              ),
              Wrap(spacing: 12, runSpacing: 12, children: playerChips),
            ],
          ),
        ),
      ),
    );
  }
}
