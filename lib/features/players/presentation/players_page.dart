import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_event.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_state.dart';
import 'package:board_game_app/features/players/presentation/form/player_form.dart';
import 'package:board_game_app/features/players/presentation/player_tile.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/navigation_bar/custom_nav_bar.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:board_game_app/features/shared/form/modal_form.dart';
import 'package:board_game_app/features/shared/slidable/pop_action_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  final popController = PopActionController();

  @override
  void initState() {
    super.initState();
    context.read<PlayerBloc>().add(GetPlayers());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          popController.handlePop();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Players")),
        body: Stack(
          children: [
            BlocBuilder(
              bloc: context.read<PlayerBloc>(),
              builder: (context, state) {
                if (state is PlayerLoading) {
                  // idk
                } else if (state is PlayersLoaded) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: SlidableAutoCloseBehavior(
                      child: ListView(
                        children: List.generate(state.players.length, (index) {
                          return PlayerTile(
                            state.players[index],
                            popController,
                          );
                        }),
                      ),
                    ),
                  );
                } else if (state is PlayerAdded || state is PlayerEdited) {
                  context.read<PlayerBloc>().add(GetPlayers());
                  Navigator.pop(context);
                } else if (state is PlayerDeleted) {
                  context.read<PlayerBloc>().add(GetPlayers());
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
                        openForm(
                          context,
                          PlayerForm(
                            formAction: FormAction.add,
                            settingsState: context
                                .read<AppSettingsBloc>()
                                .state,
                            preloadedPlayerEntity: null,
                          ),
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
      ),
    );
  }
}
