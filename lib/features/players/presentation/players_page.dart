import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_event.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_state.dart';
import 'package:board_game_app/features/players/presentation/form/player_form.dart';
import 'package:board_game_app/features/players/presentation/player_tile.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/navigation_bar/custom_nav_bar.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:board_game_app/features/shared/modal_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  @override
  void initState() {
    super.initState();
    context.read<PlayerBloc>().add(LoadPlayers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Players")),
      body: Stack(
        children: [
          BlocBuilder(
            bloc: context.read<PlayerBloc>(),
            builder: (context, state) {
              if (state is PlayerLoading) {
                // idk
              } else if (state is PlayersLoaded) {
                return ListView(
                  children: List.generate(state.players.length, (index) {
                    return PlayerTile(state.players[index]);
                  }),
                );
              } else if (state is PlayerAdded || state is PlayerEdited) {
                context.read<PlayerBloc>().add(LoadPlayers());
                Navigator.pop(context);
              } else if (state is PlayerDeleted) {
                context.read<PlayerBloc>().add(LoadPlayers());
              }

              return ListView(children: [Text('Error')]);
            },
          ),
          Positioned(
            bottom: 33,
            right: 30,
            left: 30,
            child: SizedBox(
              width: 50,
              child: CustomNavBar(
                buttons: [
                  NavigationButton(
                    onPressed: () {
                      openPlayerForm(
                        context,
                        FormAction.add,
                        context.read<AppSettingsBloc>().state,
                      );
                    },
                    iconData: Icons.add_sharp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void openPlayerForm(
  BuildContext context,
  FormAction formAction,
  AppSettingsState settingsState, {
  PlayerEntity? playerEntity,
}) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (builderContext) {
      return PlayerForm(
        formAction: formAction,
        settingsState: settingsState,
        preloadedPlayerEntity: playerEntity,
      );
    },
  );
}
