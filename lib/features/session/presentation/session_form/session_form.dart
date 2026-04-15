import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_bloc.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_event.dart';
import 'package:board_game_app/features/session/presentation/session_form/cubit/session_form_cubit.dart';
import 'package:board_game_app/features/session/presentation/session_form/session_form_player_list.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_state.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/form/modal_form.dart';
import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_cubit.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_selector.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SessionForm extends StatefulWidget {
  final AppSettingsState settingsState;
  final SessionsBloc sessionsBloc;
  const SessionForm({
    super.key,
    required this.settingsState,
    required this.sessionsBloc,
  });

  @override
  _SessionFormState createState() => _SessionFormState();
}

class _SessionFormState extends State<SessionForm> {
  final _formKey = GlobalKey<FormState>();
  bool enableScoring = true;
  DateTime sessionDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SessionFormCubit()),
        BlocProvider(create: (_) => DropdownChipCubit<BoardGameEntity>()),
      ],
      child: Builder(
        builder: (context) {
          return ModalForm(
            _formKey,
            formName: l10n.newSession,
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
                        palceholder: l10n.bgName,
                        items: context.read<AppDataCubit>().state.activeGames,
                        allowMultiple: false,
                        cubit: context.read(),
                        getChipData: (item) =>
                            DropdownChipData<BoardGameEntity>(
                              label: item.name,
                              color: Color(item.color),
                              chipValue: item,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.players),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(l10n.scoring),
                        SizedBox(width: 20),
                        Switch(
                          value: enableScoring,
                          onChanged: (value) {
                            setState(() {
                              enableScoring = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SessionFormPlayerList(enableScoring: enableScoring),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.sessionsBloc.add(
                      CreateSession(
                        boardGameId: context
                            .read<DropdownChipCubit<BoardGameEntity>>()
                            .state
                            .selected
                            .first
                            .id,
                        playedAt: sessionDate,
                        players: context
                            .read<SessionFormCubit>()
                            .state
                            .sessionPlayers,
                      ),
                    );
                  }
                },
                child: Text(l10n.save),
              ),
            ],
          );
        },
      ),
    );
  }
}
