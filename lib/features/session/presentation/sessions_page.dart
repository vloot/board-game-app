import 'package:board_game_app/core/infrastructure/dependency_injection.dart';
import 'package:board_game_app/features/navigation_bar/custom_nav_bar.dart';
import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:board_game_app/features/session/presentation/bloc/session_bloc.dart';
import 'package:board_game_app/features/session/presentation/bloc/session_event.dart';
import 'package:board_game_app/features/session/presentation/session_form.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsPage extends StatefulWidget {
  SessionsPage({Key? key}) : super(key: key);

  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sessions')),
      body: Stack(
        children: [
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
                      BlocProvider(
                        create: (_) =>
                            getIt<SessionFormBloc>()..add(LoadSessionForm()),
                        child: SessionForm(
                          settingsState: context.read<AppSettingsBloc>().state,
                        ),
                      ),
                    );
                  },
                  iconData: Icons.add_sharp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
