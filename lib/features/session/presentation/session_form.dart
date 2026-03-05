import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/session/presentation/bloc/session_bloc.dart';
import 'package:board_game_app/features/session/presentation/bloc/session_state.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:board_game_app/features/shared/form/modal_form.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_selector.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SessionForm extends StatefulWidget {
  final AppSettingsState settingsState;
  const SessionForm({super.key, required this.settingsState});

  @override
  _SessionFormState createState() => _SessionFormState();
}

class _SessionFormState extends State<SessionForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime sessionDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionFormBloc, SessionFormState>(
      builder: (context, state) {
        if (state is SessionFormLoading) {
          return CircularProgressIndicator();
        } else if (state is SessionFormLoaded) {
          return ModalForm(
            _formKey,
            formName: 'New session',
            formAction: FormAction.add,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      sessionDate =
                          await showDatePicker(
                            context: context,
                            initialDate: sessionDate,
                            firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                            lastDate: DateTime.now(),
                          ) ??
                          sessionDate;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            DateFormat(
                              'E, MMM d',
                              widget.settingsState.settings.locale
                                  .toLanguageTag(),
                            ).format(sessionDate),
                          ),
                          Text(
                            DateFormat(
                              'yyyy',
                              widget.settingsState.settings.locale
                                  .toLanguageTag(),
                            ).format(sessionDate),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: DropdownChipSelector<BoardGameEntity>(
                        palceholder: "Board Game",
                        items: state.boardGames,
                        allowMultiple: false,
                        getChipData: (item) =>
                            DropdownChipData<BoardGameEntity>(
                              label: item.name,
                              color: Color(item.color),
                              chipValue: item,
                            ),
                      ),
                    ),
                  ),
                  Checkbox(value: false, onChanged: (value) {}),
                ],
              ),

              DropdownChipSelector<PlayerEntity>(
                palceholder: "Players",
                items: state.players,
                getChipData: (item) => DropdownChipData<PlayerEntity>(
                  label: item.name,
                  color: Color(item.color),
                  chipValue: item,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text("Save")),
            ],
          );
        }

        return Text('Error');
      },
    );
  }
}
