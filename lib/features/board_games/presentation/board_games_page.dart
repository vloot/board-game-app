import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_state.dart';
import 'package:board_game_app/features/board_games/presentation/form/board_game_form.dart';
import 'package:board_game_app/features/board_games/presentation/board_game_tile.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            child: CustomControlsBox(),
          ),
        ],
      ),
    );
  }
}

class CustomControlsBox extends StatelessWidget {
  const CustomControlsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.blueGrey.withAlpha(164),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomControlButton(
            onPressed: () {},
            iconData: Icons.arrow_back_sharp,
          ),
          CustomControlButton(onPressed: () {}, iconData: Icons.casino_sharp),
          CustomControlButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                showDragHandle: true,
                context: context,
                builder: (context) {
                  return BoardGameForm(
                    settingsState: context.read<AppSettingsBloc>().state,
                  );
                },
              );
            },
            iconData: Icons.add_sharp,
          ),
        ],
      ),
    );
  }
}

class CustomControlButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;
  const CustomControlButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(90, 64),
        iconSize: 42,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      child: Icon(iconData),
    );
  }
}
