import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/player_count.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/form/double_input.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:board_game_app/features/shared/input_with_color.dart';
import 'package:board_game_app/features/shared/form/modal_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardGameForm extends StatefulWidget {
  final AppSettingsState settingsState;
  final BoardGameEntity? boardGame;

  const BoardGameForm({super.key, required this.settingsState, this.boardGame});

  @override
  _BoardGameFormState createState() => _BoardGameFormState();
}

class _BoardGameFormState extends State<BoardGameForm> {
  final TextEditingController _bgNameController = TextEditingController();
  late final TextEditingController _minPlayers;
  late final TextEditingController _maxPlayers;
  final _formKey = GlobalKey<FormState>();
  Color pickedColor = Colors.white;

  bool isValidated = true;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _minPlayers = TextEditingController();
    _maxPlayers = TextEditingController();
  }

  String getPlayerCountString(int number) {
    if (number == 0) {
      return '';
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.boardGame != null) {
      isEditing = true;
      _bgNameController.text = widget.boardGame!.name;
      _minPlayers.text = getPlayerCountString(
        widget.boardGame!.playerCount.min,
      );
      _maxPlayers.text = getPlayerCountString(
        widget.boardGame!.playerCount.max,
      );
    }

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
          preloadedColor: widget.boardGame == null
              ? null
              : Color(widget.boardGame!.color),
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

                if (!isValidated) {
                  return;
                }

                if (isEditing) {
                  context.read<BoardGameBloc>().add(
                    EditBoardGame(
                      BoardGameEntity(
                        id: widget.boardGame!.id,
                        playerCount: PlayerCount(
                          min: int.tryParse(_minPlayers.text) ?? 0,
                          max: int.tryParse(_maxPlayers.text) ?? 0,
                        ),
                        name: _bgNameController.text,
                        color: pickedColor.toARGB32(),
                      ),
                    ),
                  );
                } else {
                  // adding new board game
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
