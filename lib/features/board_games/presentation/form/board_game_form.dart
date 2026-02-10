import 'dart:math';

import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/player_count.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_bloc.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/form/color_popup.dart';
import 'package:board_game_app/features/board_games/presentation/form/double_input.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
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
  Color bgColor = Colors.white;
  final _formKey = GlobalKey<FormState>();

  bool isValidated = true;

  @override
  void initState() {
    super.initState();
    bgColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withAlpha(255);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final keyboard = mq.viewInsets.bottom;
    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      child: SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: (mq.size.height - keyboard) * 0.65,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 22, left: 42, right: 42),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        'TODO name this form',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().length <= 1) {
                              return 'Enter a valid name';
                            }
                            return null;
                          },
                          autofocus: true,
                          controller: _bgNameController,
                          decoration: InputDecoration(
                            labelText: "Board Game",
                            labelStyle: TextStyle(
                              color: Color(
                                widget.settingsState.settings.theme.textColor,
                              ),
                              fontSize: 18,
                            ),
                            hintFadeDuration: Duration(seconds: 1),
                            contentPadding: EdgeInsets.fromLTRB(12, 16, 42, 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(
                                  widget
                                      .settingsState
                                      .settings
                                      .theme
                                      .primaryColorAccent,
                                ),
                              ),
                            ),
                            // counterText: "",
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 0,
                          bottom: 0,
                          child: ColorPopup(
                            startingColor: bgColor,
                            onColorChanged: (value) {
                              bgColor = value;
                            },
                          ),
                        ),
                      ],
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
                                    color: bgColor.toARGB32(),
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 50),
                          ),
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
