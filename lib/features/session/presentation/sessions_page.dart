import 'package:board_game_app/core/infrastructure/dependency_injection.dart';
import 'package:board_game_app/features/navigation_bar/custom_nav_bar.dart';
import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_bloc.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_event.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_state.dart';
import 'package:board_game_app/features/session/presentation/session_form/session_form.dart';
import 'package:board_game_app/features/session/presentation/session_tile.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/extensions.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:board_game_app/features/shared/slidable/pop_action_controller.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  late final PopActionController popActionController;

  @override
  void initState() {
    super.initState();
    popActionController = PopActionController();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settings = context.read<AppSettingsBloc>().state.settings;

    return BlocProvider(
      create: (_) {
        final bloc = getIt<SessionsBloc>();
        bloc.add(LoadSessions());
        return bloc;
      },
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            popActionController.handlePop();
          }
        },
        child: Scaffold(
          backgroundColor: Color(settings.theme.backgroundColor),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Color(settings.theme.secondaryColor),
              ),
            ),
            centerTitle: true,
            title: Text(
              l10n.sessions,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 26,
                color: Color(settings.theme.secondaryColor),
              ),
            ),
            backgroundColor: Color(settings.theme.primaryColor),
          ),
          body: Builder(
            builder: (context) {
              return Stack(
                children: [
                  BlocBuilder<SessionsBloc, SessionsState>(
                    bloc: context.read<SessionsBloc>(),
                    builder: (context, state) {
                      switch (state) {
                        case SessionsLoaded():
                          final children = generateSessionCards(
                            state,
                            context,
                          ).withBottomSpacing();

                          return SlidableAutoCloseBehavior(
                            child: ListView(children: children),
                          );

                        case SessionFormSuccess():
                        case SessionDeleted():
                          context.read<SessionsBloc>().add(LoadSessions());
                          if (state is SessionFormSuccess) {
                            Navigator.pop(context);
                          }
                          return const SizedBox.shrink();

                        case SessionsError():
                          return Text(state.message);

                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                  CustomNavBar(
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
                ],
              );
            },
          ),
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

      return SessionTile(
        popActionController: popActionController,
        sessionEntity: state.sessions[index],
        appDataState: appDataState,
        playerChips: playerChips,
      );
    });
  }
}
