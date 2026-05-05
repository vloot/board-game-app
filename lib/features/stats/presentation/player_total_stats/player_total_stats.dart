import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_cubit.dart';
import 'package:board_game_app/features/shared/multiselect/cubit/dropdown_selector_state.dart';
import 'package:board_game_app/features/shared/multiselect/dropdown_chip_data.dart';
import 'package:board_game_app/features/stats/domain/player_winrate.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_event.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_state.dart';
import 'package:board_game_app/features/stats/presentation/player_total_stats/bar_labels_overlay.dart';
import 'package:board_game_app/features/stats/presentation/stats_selector.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerTotalStats extends StatelessWidget {
  const PlayerTotalStats({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final statsBloc = context.read<StatsBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DropdownChipCubit<PlayerEntity>()
            ..setMultiple(
              context.read<AppDataCubit>().state.activePlayers.toSet(),
            ),
        ),
        BlocProvider(
          create: (_) => DropdownChipCubit<BoardGameEntity>()
            ..setMultiple(
              context.read<AppDataCubit>().state.activeGames.toSet(),
            ),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          final halfWidth = constraints.maxWidth / 2.25;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatsSelector<PlayerEntity>(
                    title: l10n.players,
                    halfWidth: halfWidth,
                    l10n: l10n,
                    height: 187,
                    items: context.read<AppDataCubit>().state.activePlayers,
                    getChipData: (item) => DropdownChipData<PlayerEntity>(
                      label: item.name,
                      color: Color(item.color),
                      chipValue: item,
                    ),
                  ),
                  StatsSelector<BoardGameEntity>(
                    title: l10n.boardGames,
                    halfWidth: halfWidth,
                    l10n: l10n,
                    height: 187,
                    items: context.read<AppDataCubit>().state.activeGames,
                    getChipData: (item) => DropdownChipData<BoardGameEntity>(
                      label: item.name,
                      color: Color(item.color),
                      chipValue: item,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              MultiBlocListener(
                listeners: [
                  BlocListener<
                    DropdownChipCubit<PlayerEntity>,
                    DropdownSelectorState<PlayerEntity>
                  >(
                    listener: (context, state) {
                      context.read<StatsBloc>().add(
                        UpdatePlayerWinrateFilter(
                          playerIds: state.selected.map((e) => e.id).toList(),
                        ),
                      );
                    },
                  ),
                  BlocListener<
                    DropdownChipCubit<BoardGameEntity>,
                    DropdownSelectorState<BoardGameEntity>
                  >(
                    listener: (context, state) {
                      context.read<StatsBloc>().add(
                        UpdatePlayerWinrateFilter(
                          boardGameIds: state.selected
                              .map((e) => e.id)
                              .toList(),
                        ),
                      );
                    },
                  ),
                ],
                child: BlocBuilder(
                  bloc: statsBloc,
                  builder: (context, state) {
                    if (state is PlayerWinratesLoaded) {
                      final playersData = context
                          .read<AppDataCubit>()
                          .state
                          .playersById;

                      final maxY = state.playerWinrates.isEmpty
                          ? null
                          : state.playerWinrates
                                .map((e) => e.gamesPlayed)
                                .reduce((a, b) => a > b ? a : b);

                      return Container(
                        alignment: Alignment.center,
                        height: 400,
                        padding: EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            BarChart(
                              BarChartData(
                                maxY: maxY?.toDouble(),
                                rotationQuarterTurns: 0,
                                alignment: BarChartAlignment.spaceEvenly,
                                borderData: FlBorderData(show: false),
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: (maxY ?? 10) > 10
                                      ? (maxY! / 5).ceilToDouble()
                                      : 1,
                                  getDrawingHorizontalLine: (value) => FlLine(
                                    color: Colors.grey.withAlpha(64),
                                    strokeWidth: 1,
                                  ),
                                ),
                                rangeAnnotations: RangeAnnotations(),
                                extraLinesData: ExtraLinesData(),
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 42,
                                      getTitlesWidget: (value, meta) {
                                        final index = value.toInt();
                                        if (index < 0 ||
                                            index >=
                                                state.playerWinrates.length) {
                                          return const SizedBox();
                                        }

                                        final playerId = state
                                            .playerWinrates[index]
                                            .playerId;
                                        final player = playersData[playerId]!;

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Text(
                                            player.name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  rightTitles: AxisTitles(),
                                  topTitles: AxisTitles(),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: (maxY ?? 10) > 10
                                          ? (maxY! / 5).ceilToDouble()
                                          : 1,
                                    ),
                                  ),
                                ),
                                barTouchData: BarTouchData(
                                  enabled: false,
                                  touchTooltipData: BarTouchTooltipData(
                                    getTooltipItem:
                                        (group, groupIndex, rod, rodIndex) {
                                          return BarTooltipItem(
                                            playersData[state
                                                    .playerWinrates[group.x]
                                                    .playerId]!
                                                .name,
                                            TextStyle(),
                                          );
                                        },
                                  ),
                                ),
                                barGroups: getGroups(
                                  state.playerWinrates,
                                  context
                                      .read<AppDataCubit>()
                                      .state
                                      .playersById,
                                ),
                              ),
                            ),
                            BarLabelsOverlay(state.playerWinrates),
                          ],
                        ),
                      );
                    }

                    return Text('Error'); // TODO handle error
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<BarChartGroupData> getGroups(
    List<PlayerWinrateEntity> items,
    Map<int, PlayerEntity> playersById,
  ) {
    final output = <BarChartGroupData>[];

    for (int i = 0; i < items.length; i++) {
      final e = items[i];
      final player = playersById[e.playerId]!;

      final wins = e.wins.toDouble();
      final losses = (e.gamesPlayed - e.wins).toDouble();
      final baseColor = Color(player.color);

      output.add(
        BarChartGroupData(
          x: i,
          barsSpace: 0,
          groupVertically: true,
          barRods: [
            BarChartRodData(
              toY: wins + losses,
              width: 56,
              borderRadius: BorderRadius.circular(6),
              rodStackItems: [
                BarChartRodStackItem(0, losses, _lossColor(baseColor)),
                BarChartRodStackItem(
                  losses - 0.06,
                  losses + 0.06,
                  Colors.blueGrey.withAlpha(42),
                ),
                BarChartRodStackItem(
                  losses,
                  losses + wins,
                  _winColor(baseColor),
                ),
              ],
              color: Color(player.color),
            ),
          ],
        ),
      );
    }

    return output;
  }

  Color _winColor(Color base) {
    final hsl = HSLColor.fromColor(base);
    return hsl.withLightness((hsl.lightness * 1.05).clamp(0.0, 1.0)).toColor();
  }

  Color _lossColor(Color base) {
    final hsl = HSLColor.fromColor(base);
    return hsl
        .withSaturation((hsl.saturation * 0.4).clamp(0.0, 1.0))
        .withLightness((hsl.lightness * 0.7).clamp(0.0, 1.0))
        .toColor();
  }

  LinearGradient buildPlayerGradient(int colorValue) {
    final base = Color(colorValue);
    final hsl = HSLColor.fromColor(base);

    final light = hsl
        .withLightness((hsl.lightness + 0.28).clamp(0.0, 1.0))
        .toColor();

    // final mid = hsl
    //     .withSaturation((hsl.saturation + 0.15).clamp(0.0, 1.0))
    //     .toColor();

    final dark = hsl
        .withLightness((hsl.lightness - 0.12).clamp(0.0, 1.0))
        .toColor();

    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [light, base, dark],
    );
  }
}
