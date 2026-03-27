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
                      print(state.sessions.length);
                      return ListView(
                        children: List.generate(state.sessions.length, (index) {
                          return Text(
                            context
                                .read<AppDataCubit>()
                                .state
                                .gamesById[state.sessions[index].id]!
                                .name,
                          );
                        }),
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
}
