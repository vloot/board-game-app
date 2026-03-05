import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_state.dart';
import 'package:board_game_app/features/board_games/presentation/form/board_game_form.dart';
import 'package:board_game_app/features/board_games/presentation/board_game_tile.dart';
import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/navigation_bar/custom_nav_bar.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardGamesPage extends StatefulWidget {
  const BoardGamesPage({super.key});

  @override
  _BoardGamesPageState createState() => _BoardGamesPageState();
}

class _BoardGamesPageState extends State<BoardGamesPage> {
  @override
  void initState() {
    super.initState();
    context.read<BoardGameBloc>().add(LoadBoardGames());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Board Games")),
      body: Stack(
        children: [
          BlocBuilder(
            // listener: (context, state) {},
            bloc: context.read<BoardGameBloc>(),
            builder: (context, state) {
              if (state is LoadBoardGames) {
                // return Text('Loading');
              } else if (state is BoardGameLoadAllState) {
                return ListView(
                  children: List.generate(state.boardGames.length, (index) {
                    return BoardGameTile(entity: state.boardGames[index]);
                  }),
                );
              } else if (state is BoardGameAddedState) {
                context.read<BoardGameBloc>().add(LoadBoardGames());
                Navigator.pop(context);
              }
              return SizedBox(height: 10, child: Text('Error'));
            },
          ),
          Positioned(
            bottom: 33,
            right: 30,
            left: 30,
            child: CustomNavBar(
              buttons: [
                NavigationButton(
                  onPressed: () {},
                  iconData: Icons.casino_sharp,
                ),
                NavigationButton(
                  onPressed: () {
                    openForm(
                      context,
                      BoardGameForm(
                        settingsState: context.read<AppSettingsBloc>().state,
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
