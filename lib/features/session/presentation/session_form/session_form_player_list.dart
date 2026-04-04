import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/session/domain/session_player_entity.dart';
import 'package:board_game_app/features/session/presentation/session_form/cubit/session_form_cubit.dart';
import 'package:board_game_app/features/session/presentation/session_form/cubit/session_form_state.dart';
import 'package:board_game_app/features/session/presentation/session_form/session_form_player_tile.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';

class SessionFormPlayerList extends StatefulWidget {
  final bool enableScoring;

  const SessionFormPlayerList({super.key, required this.enableScoring});

  @override
  _SessionFormPlayerListState createState() => _SessionFormPlayerListState();
}

class _SessionFormPlayerListState extends State<SessionFormPlayerList> {
  final Map<String, FocusNode> _focusNodes = {};
  final Map<String, TextEditingController> _controllers = {};

  TextEditingController controller(String id, int points) => _controllers
      .putIfAbsent(id, () => TextEditingController(text: '$points'));

  FocusNode focusNode(String id) => _focusNodes.putIfAbsent(id, () {
    final node = FocusNode();
    node.addListener(() {
      if (!node.hasFocus) {
        final text = _controllers[id]?.text ?? '';
        context.read<SessionFormCubit>().updateSessionPlayerPointsByID(
          id,
          int.tryParse(text) ?? 0,
        );
      }
    });
    return node;
  });

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    for (final f in _focusNodes.values) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionFormCubit = context.read<SessionFormCubit>();
    final appDataCubit = context.read<AppDataCubit>();
    return BlocBuilder<SessionFormCubit, SessionFormState>(
      bloc: sessionFormCubit,
      builder: (context, state) {
        return ReorderableListView(
          footer: FractionallySizedBox(
            widthFactor: 0.85,
            child: CustomPopup(
              content: FractionallySizedBox(
                widthFactor: 0.72,
                child: SessionFromPlayerSelector(
                  players: appDataCubit.state.players,
                  cubit: sessionFormCubit,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Add'), Icon(Icons.add_sharp)],
              ),
            ),
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(state.sessionPlayers.length, (index) {
            final player = state.sessionPlayers[index];
            final playerID = player.playerId.toString();
            return SessionFormPlayerTile(
              index,
              enableScoring: widget.enableScoring,
              sessionPlayer: state.sessionPlayers[index],
              onRemove: () {
                sessionFormCubit.removeSessionPlayer(
                  state.sessionPlayers[index].playerId,
                );
              },
              key: Key('${state.sessionPlayers[index].playerId}'),
              controller: controller(playerID, player.score),
              focusNode: focusNode(playerID),
            );
          }),
          onReorder: (oldIndex, newIndex) {},
        );
      },
    );
  }
}

class SessionFromPlayerSelector extends StatelessWidget {
  const SessionFromPlayerSelector({
    super.key,
    required this.players,
    required this.cubit,
  });

  final List<PlayerEntity> players;
  final SessionFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Wrap(
          verticalDirection: VerticalDirection.up,
          alignment: WrapAlignment.start,
          spacing: 7,
          runSpacing: 7,
          children: List.generate(
            players.length,
            (index) => DropdownChip(
              chipData: DropdownChipData<PlayerEntity>(
                label: players[index].name,
                color: Color(players[index].color),
                chipValue: players[index],
              ),
              selected: cubit.containsSessionPlayer(players[index]),
              onSelected: (value) {
                if (value) {
                  // add
                  cubit.addSessionPlayer(
                    SessionPlayerEntity(playerId: players[index].id),
                  );
                } else {
                  // remove
                  cubit.removeSessionPlayer(players[index].id);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
