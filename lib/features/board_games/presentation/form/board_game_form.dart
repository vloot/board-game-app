import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/player_count.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/form/double_input.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:board_game_app/features/shared/input_with_color.dart';
import 'package:board_game_app/features/shared/modal_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardGameForm extends StatefulWidget {
  final AppSettingsState settingsState;

  const BoardGameForm({super.key, required this.settingsState});

  @override
  _BoardGameFormState createState() => _BoardGameFormState();
}

class _BoardGameFormState extends State<BoardGameForm> {
  final TextEditingController _bgNameController = TextEditingController();
  final TextEditingController _minPlayers = TextEditingController();
  final TextEditingController _maxPlayers = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Color pickedColor = Colors.white;

  bool isValidated = true;

  @override
  Widget build(BuildContext context) {
    return ModalForm(
      _formKey,
      formAction: FormAction.add,
      formName: "New Board Game",
      children: [
        InputWithColor(
          labelText: "Board Game",
          textController: _bgNameController,
          settingsState: widget.settingsState,
          onColorPicked: (color) => pickedColor = color,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 128,
              child: DoubleInput(
                isValidated: isValidated,
                minPlayers: _minPlayers,
                maxPlayers: _maxPlayers,
              ),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  isValidated = _formKey.currentState!.validate();
                });

                if (isValidated) {
                  context.read<BoardGameBloc>().add(
                    AddBoardGame(
                      BoardGameEntity(
                        playerCount: PlayerCount(
                          min: _minPlayers.text.isEmpty
                              ? 0
                              : int.parse(_minPlayers.text),
                          max: _maxPlayers.text.isEmpty
                              ? 0
                              : int.parse(_maxPlayers.text),
                        ),
                        name: _bgNameController.text,
                        color: pickedColor.toARGB32(),
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );
  }
}
