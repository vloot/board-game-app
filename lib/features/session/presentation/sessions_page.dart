import 'package:board_game_app/core/infrastructure/dependency_injection.dart';
import 'package:board_game_app/features/navigation_bar/custom_nav_bar.dart';
import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_bloc.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_event.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_state.dart';
import 'package:board_game_app/features/session/presentation/session_form/session_form.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = getIt<SessionsBloc>();
        bloc.add(LoadSessions());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Sessions')),
        body: Builder(
          builder: (context) {
            return Stack(
              children: [
                BlocBuilder<SessionsBloc, SessionsState>(
                  bloc: context.read<SessionsBloc>(),
                  builder: (context, state) {
                    if (state is SessionsLoaded) {
                      return ListView(
                        children: generateSessionCards(state, context),
                      );
                    } else if (state is SessionFormSuccess) {
                      context.read<SessionsBloc>().add(LoadSessions());
                    } else if (state is SessionsError) {
                      return Text(state.message);
                    }

                    return ListView(children: [Text('123')]);
                  },
                ),
                Positioned(
                  left: 33,
                  right: 33,
                  bottom: 33,
                  child: CustomNavBar(
                    buttons: [
                      NavigationButton(
                        onPressed: () {
                          openForm(
                            context,
                            SessionForm(
                              sessionsBloc: context.read<SessionsBloc>(),
                              settingsState: context
                                  .read<AppSettingsBloc>()
                                  .state,
                            ),
                          );
                        },
                        iconData: Icons.add_sharp,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> generateSessionCards(
    SessionsLoaded state,
    BuildContext context,
  ) {
    return List.generate(state.sessions.length, (index) {
      final appDataState = context.read<AppDataCubit>().state;

      var playerChips = <Widget>[];
      var sortedSessionPlayers = state.sessions[index].players;
      sortedSessionPlayers.sort((a, b) {
        if (a.isWinner == b.isWinner) return 0;
        return a.isWinner ? -1 : 1;
      });

      for (var player in sortedSessionPlayers) {
        var playerEntity = appDataState.playersById[player.playerId];

        playerChips.add(
          ChoiceChip(
            showCheckmark: false,
            side: BorderSide(
              color: Color(playerEntity!.color),
              strokeAlign: 1.5,
              width: 2,
            ),
            label: Text(
              style: TextStyle(
                // color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              player.isWinner ? '🏆 ${playerEntity.name}' : playerEntity.name,
            ),
            selectedColor: Color(playerEntity.color).withAlpha(55),
            selected: true,
            onSelected: (value) {},
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appDataState
                      .gamesById[state.sessions[index].boardGameId]!
                      .name,
                ),
                Wrap(spacing: 12, runSpacing: 12, children: playerChips),
              ],
            ),
          ),
        ),
      );
    });
  }
}
