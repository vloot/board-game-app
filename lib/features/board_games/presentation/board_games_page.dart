import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_state.dart';
import 'package:board_game_app/features/board_games/presentation/form/board_game_form.dart';
import 'package:board_game_app/features/board_games/presentation/board_game_tile.dart';
import 'package:board_game_app/features/navigation_bar/navigation_button.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/navigation_bar/custom_nav_bar.dart';
import 'package:board_game_app/features/shared/extensions.dart';
import 'package:board_game_app/features/shared/form/form_launcher.dart';
import 'package:board_game_app/features/shared/slidable/pop_action_controller.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BoardGamesPage extends StatefulWidget {
  const BoardGamesPage({super.key});

  @override
  _BoardGamesPageState createState() => _BoardGamesPageState();
}

class _BoardGamesPageState extends State<BoardGamesPage> {
  final popController = PopActionController();

  @override
  void initState() {
    super.initState();
    context.read<BoardGameBloc>().add(LoadBoardGames());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settings = context.read<AppSettingsBloc>().state.settings;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          popController.handlePop();
        }
      },
      child: Scaffold(
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
            l10n.boardGames,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 26,
              color: Color(settings.theme.secondaryColor),
            ),
          ),
          backgroundColor: Color(settings.theme.primaryColor),
        ),
        backgroundColor: Color(settings.theme.backgroundColor),
        body: Stack(
          children: [
            BlocBuilder(
              // listener: (context, state) {},
              bloc: context.read<BoardGameBloc>(),
              builder: (context, state) {
                if (state is LoadBoardGames) {
                  // return Text('Loading');
                } else if (state is BoardGameLoadAllState) {
                  return SlidableAutoCloseBehavior(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListView(
                        children: (List.generate(state.boardGames.length, (
                          index,
                        ) {
                          return BoardGameTile(
                            entity: state.boardGames[index],
                            popActionController: popController,
                          );
                        })).withBottomSpacing(),
                      ),
                    ),
                  );
                } else if (state is BoardGameAddedState ||
                    state is BoardGameEditedState) {
                  context.read<BoardGameBloc>().add(LoadBoardGames());
                  Navigator.pop(context);
                } else if (state is BoardGameDeletedState) {
                  context.read<BoardGameBloc>().add(LoadBoardGames());
                }
                return SizedBox(height: 10, child: Text(l10n.error));
              },
            ),
            CustomNavBar(
              buttons: [
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
          ],
        ),
      ),
    );
  }
}
