import 'package:board_game_app/features/board_games/presentation/board_games_page.dart';
import 'package:board_game_app/features/players/presentation/players_page.dart';
import 'package:board_game_app/features/session/presentation/sessions_page.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:board_game_app/features/settings/presentation/settings_page.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settings = context.read<AppSettingsBloc>().state.settings;
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(state.settings.theme.backgroundColor),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "BoardGame Stats",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 26,
                color: Color(settings.theme.secondaryColor),
              ),
            ),
            flexibleSpace: SafeArea(
              child: Container(
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Color(settings.theme.secondaryColor),
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ),
            ),
            backgroundColor: Color(state.settings.theme.primaryColor),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Builder(
              builder: (context) {
                final size = MediaQuery.of(context).size.width * 0.45;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DashboardButton(
                          width: size,
                          height: size,
                          text: l10n.boardGames,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BoardGamesPage(),
                              ),
                            );
                          },
                        ),
                        DashboardButton(
                          width: size,
                          height: size,
                          text: l10n.players,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlayersPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    DashboardButton(
                      width: size * 2,
                      height: size / 2,
                      text: l10n.sessions,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SessionsPage(),
                          ),
                        );
                      },
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     DashboardButton(
                    //       width: size,
                    //       height: size,
                    //       text: l10n.stats,
                    //       onPressed: () {},
                    //     ),
                    //     DashboardButton(
                    //       width: size,
                    //       height: size,
                    //       text: l10n.randomGame,
                    //       onPressed: () {},
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 30),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.text,
  });

  final double width;
  final double height;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final settings = context.read<AppSettingsBloc>().state.settings;
    return Container(
      padding: EdgeInsets.all(7),
      width: width,
      height: height,
      child: Material(
        elevation: 4,
        shadowColor: Color(settings.theme.shadowColor),
        borderRadius: BorderRadius.circular(12),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Color(settings.theme.secondaryColor),
            side: const BorderSide(color: Colors.transparent, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
