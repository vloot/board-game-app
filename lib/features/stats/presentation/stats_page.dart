import 'package:board_game_app/core/infrastructure/dependency_injection.dart';
import 'package:board_game_app/features/settings/presentation/app_settings_bloc.dart';
import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/custom_app_bar.dart';
import 'package:board_game_app/features/stats/data/player_winrate_filter.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_event.dart';
import 'package:board_game_app/features/stats/presentation/player_total_stats/player_total_stats.dart';
import 'package:board_game_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settings = context.read<AppSettingsBloc>().state.settings;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // TODO ..add here is temporary
          create: (_) => getIt<StatsBloc>()
            ..add(
              LoadPlayerWinrates(
                filter: PlayerWinrateFilter(
                  playerIds: context
                      .read<AppDataCubit>()
                      .state
                      .activePlayers
                      .map((e) => e.id)
                      .toList(),
                  boardGameIds: context
                      .read<AppDataCubit>()
                      .state
                      .activeGames
                      .map((e) => e.id)
                      .toList(),
                ),
              ),
            ),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(settings: settings, title: l10n.stats),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: PlayerTotalStats(),
          ),
        ),
      ),
    );
  }
}
