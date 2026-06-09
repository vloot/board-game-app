import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/extensions.dart';
import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_cubit.dart';
import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_state.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_selector.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_event.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_state.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerPersonalStats extends StatelessWidget {
  const PlayerPersonalStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DropdownChipCubit<PlayerEntity>(),
      child:
          BlocListener<
            DropdownChipCubit<PlayerEntity>,
            DropdownSelectorState<PlayerEntity>
          >(
            listener: (context, state) {
              final player = state.selected.firstOrNull;
              if (player != null) {
                context.read<StatsBloc>().add(
                  LoadPlayerPersonalStats(playerId: player.id),
                );
              }
            },
            child: Builder(
              builder: (context) {
                final l10n = AppLocalizations.of(context)!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                      top: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<StatsBloc, StatsState>(
                          builder: (context, state) {
                            if (state is StatsLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is StatsError) {
                              return Text(state.message);
                            }
                            if (state is PlayerPersonalStatsLoaded) {
                              final stats = state.stats;
                              final gamesById = context
                                  .read<AppDataCubit>()
                                  .state
                                  .gamesById;

                              final sections = stats.playedGames.map((
                                gameStat,
                              ) {
                                final game = gamesById[gameStat.boardGameId];
                                final name = game?.name ?? l10n.unknown;
                                final color = game != null
                                    ? Color(game.color)
                                    : Colors.grey;
                                return PieChartSectionData(
                                  value: gameStat.timesPlayed.toDouble(),
                                  color: color,
                                  title: '$name\n${gameStat.timesPlayed}',
                                  radius: 128,
                                  titlePositionPercentageOffset: 0.55,
                                  titleStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: color.overlayColor,
                                  ),
                                );
                              }).toList();

                              const textStyle = TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              );

                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '📊 ${l10n.gamesPlayed}: ${stats.gamesPlayed}',
                                        style: textStyle,
                                      ),
                                      Text(
                                        '🏆 ${l10n.wins}: ${stats.wins} (${((stats.wins / stats.gamesPlayed) * 100).toStringAsPrecision(2)}%)',
                                        style: textStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 100),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: SizedBox(
                                      height: 240,
                                      child: PieChart(
                                        PieChartData(
                                          sections: sections,
                                          sectionsSpace: 0.5,
                                          centerSpaceRadius: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(l10n.selectPlayer),
                            SizedBox(
                              width: 200,
                              child: DropdownChipSelector<PlayerEntity>(
                                allowMultiple: false,
                                palceholder: 'Choose a player',
                                items: context
                                    .read<AppDataCubit>()
                                    .state
                                    .activePlayers,
                                getChipData: (item) => DropdownChipData(
                                  label: item.name,
                                  color: Color(item.color),
                                  chipValue: item,
                                ),
                                cubit: context
                                    .read<DropdownChipCubit<PlayerEntity>>(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
    );
  }
}
