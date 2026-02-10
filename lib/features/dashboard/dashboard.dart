import 'package:board_game_app/features/board_games/presentation/board_games_page.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BoardGameStat'),
            backgroundColor: Color(state.settings.theme.primaryColor),
          ),
          body: Container(
            color: Color(state.settings.theme.backgroundColor),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Builder(
              builder: (context) {
                final size = MediaQuery.of(context).size.width * 0.45;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DashboardButton(
                          width: size,
                          height: size,
                          text: "Board games",
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
                          text: "Players",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    DashboardButton(
                      width: size * 2,
                      height: size / 2,
                      text: "Sessions",
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DashboardButton(
                          width: size,
                          height: size,
                          text: "Statistics",
                          onPressed: () {},
                        ),
                        DashboardButton(
                          width: size,
                          height: size,
                          text: "Pick a random game",
                          onPressed: () {},
                        ),
                      ],
                    ),
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
    return Container(
      padding: EdgeInsets.all(7),
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: Text(text),
      ),
    );
  }
}
