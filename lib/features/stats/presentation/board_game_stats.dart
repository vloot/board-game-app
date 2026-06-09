import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_event.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_state.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardGameStats extends StatefulWidget {
  const BoardGameStats({super.key});

  @override
  State<BoardGameStats> createState() => _BoardGameStatsState();
}

class _BoardGameStatsState extends State<BoardGameStats> {
  DateTimeRange? _dateRange;

  static final _now = DateTime.now();
  static final _firstDate = DateTime(2022, 1, 1);

  @override
  void initState() {
    super.initState();
    context.read<StatsBloc>().add(LoadBoardGameStats());
  }

  String _formatRange(AppLocalizations l10n) {
    if (_dateRange == null) return l10n.allTime;
    String fmt(DateTime d) =>
        '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year}';
    return '${fmt(_dateRange!.start)} - ${fmt(_dateRange!.end)}';
  }

  Future<void> _openPicker() async {
    final l10n = AppLocalizations.of(context)!;
    final result = await showDateRangePicker(
      context: context,
      initialDateRange: _dateRange,
      firstDate: _firstDate,
      lastDate: _now,
      currentDate: _now,
      saveText: l10n.done,
    );

    if (result != null) {
      setState(() => _dateRange = result);
      if (!mounted) return;
      context.read<StatsBloc>().add(LoadBoardGameStats(range: result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      bloc: context.read<StatsBloc>(),
      builder: (context, state) {
        final l10n = AppLocalizations.of(context)!;
        if (state is BoardGameStatsLoaded) {
          if (state.boardGameStats.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(l10n.noPlaysInRange),
            );
          }
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.73,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(l10n.bgName), Text(l10n.sessions)],
                      ),
                    ),
                    ...List.generate(state.boardGameStats.length, (index) {
                      final boardGame = context
                          .read<AppDataCubit>()
                          .state
                          .gamesById[state.boardGameStats[index].boardGameId]!;

                      final color = Color(boardGame.color);
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        height: 75,
                        child: Card(
                          shadowColor: color,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.circle_sharp, color: color),
                                    const SizedBox(width: 16),
                                    Text(boardGame.name),
                                  ],
                                ),
                                Text(
                                  state.boardGameStats[index].timesPlayed
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: FilledButton.tonal(
                    onPressed: _openPicker,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_month_sharp),
                        SizedBox(width: 10),
                        Text(_formatRange(l10n)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return Text(l10n.error);
      },
    );
  }
}
