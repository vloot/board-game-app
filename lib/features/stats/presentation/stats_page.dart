import 'package:board_game_app/core/infrastructure/dependency_injection.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/custom_app_bar.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:board_game_app/features/stats/presentation/board_game_stats.dart';
import 'package:board_game_app/features/stats/presentation/player_total_stats/player_total_stats.dart';
import 'package:board_game_app/features/stats/presentation/player_stats/player_winrates_stats.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  StatsChartType selectedChart = StatsChartType.total;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settings = context.read<AppSettingsBloc>().state.settings;
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<StatsBloc>())],
      child: Scaffold(
        appBar: CustomAppBar(settings: settings, title: l10n.stats),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: SegmentedButton<StatsChartType>(
                          showSelectedIcon: false,
                          selected: {selectedChart},
                          onSelectionChanged: (selection) {
                            setState(() {
                              selectedChart = selection.first;
                            });
                          },
                          segments: [
                            ButtonSegment(
                              value: StatsChartType.total,
                              label: Text(
                                l10n.total,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ButtonSegment(
                              value: StatsChartType.personal,
                              label: Text(
                                'Perosonal',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ButtonSegment(
                              value: StatsChartType.boardGames,
                              label: Text(
                                l10n.boardGames,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                if (selectedChart == StatsChartType.total)
                  const PlayerTotalStats(),
                if (selectedChart == StatsChartType.personal)
                  const PlayerPersonalStats(),
                if (selectedChart == StatsChartType.boardGames)
                  const BoardGameStats(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ButtonSegment<String> buildSegment(String value) {
    return ButtonSegment(
      value: value,
      label: SizedBox(height: 42, child: Center(child: Text(value))),
    );
  }
}

enum StatsChartType { total, winrates, boardGames, personal }
