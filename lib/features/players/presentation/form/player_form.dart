import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_event.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/input_with_color.dart';
import 'package:board_game_app/features/shared/form/modal_form.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerForm extends StatefulWidget {
  final AppSettingsState settingsState;
  final PlayerEntity? preloadedPlayerEntity;
  final FormAction formAction;

  const PlayerForm({
    super.key,
    required this.settingsState,
    this.preloadedPlayerEntity,
    required this.formAction,
  });

  @override
  _PlayerFormState createState() => _PlayerFormState();
}

class _PlayerFormState extends State<PlayerForm> {
  final TextEditingController _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isValidated = true;
  Color color = Colors.white;

  @override
  void setState(VoidCallback fn) async {
    super.setState(fn);
    context.read<PlayerBloc>().add(GetPlayers());
  }

  @override
  Widget build(BuildContext context) {
    Color? preloadedColor;

    if (widget.formAction == FormAction.edit &&
        widget.preloadedPlayerEntity != null) {
      preloadedColor = Color(widget.preloadedPlayerEntity!.color);
      _name.text = widget.preloadedPlayerEntity!.name;
    }

    return ModalForm(
      _formKey,
      formAction: widget.formAction,
      formName: 'New Player',
      children: [
        InputWithColor(
          preloadedColor: preloadedColor,
          textController: _name,
          settingsState: context.read<AppSettingsBloc>().state,
          onColorPicked: (color) => this.color = color,
          labelText: "Name",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FilledButton(
            onPressed: () {
              setState(() {
                _isValidated = _formKey.currentState!.validate();
              });

              if (!_isValidated) {
                return;
              }

              if (widget.formAction == FormAction.add) {
                context.read<PlayerBloc>().add(
                  AddPlayer(
                    PlayerEntity(color: color.toARGB32(), name: _name.text),
                  ),
                );
              } else if (widget.formAction == FormAction.edit &&
                  widget.preloadedPlayerEntity != null) {
                final updatedEntity = widget.preloadedPlayerEntity?.copyWith(
                  color: color.toARGB32(),
                  name: _name.text,
                );
                context.read<PlayerBloc>().add(EditPlayer(updatedEntity!));
              }
            },
            style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            child: Text('Save'),
          ),
        ),
      ],
    );
  }
}
