import 'package:board_game_app/features/stats/data/player_winrate_filter.dart';
import 'package:board_game_app/features/stats/domain/board_game_stat.dart';
import 'package:board_game_app/features/stats/domain/player_personal_stats.dart';
import 'package:board_game_app/features/stats/domain/player_winrate.dart';
import 'package:flutter/material.dart';

abstract class StatsState {
  const StatsState();
}

class StatsInitial extends StatsState {
  const StatsInitial();
}

class StatsLoading extends StatsState {
  const StatsLoading();
}

class PlayerWinratesLoaded extends StatsState {
  final PlayerWinrateFilter winrateFilter;
  final List<PlayerWinrateEntity> playerWinrates;

  const PlayerWinratesLoaded({
    required this.winrateFilter,
    required this.playerWinrates,
  });
}

class BoardGameStatsLoaded extends StatsState {
  final List<BoardGameStatEntity> boardGameStats;
  final DateTimeRange? range;

  const BoardGameStatsLoaded({required this.boardGameStats, this.range});
}

class PlayerPersonalStatsLoaded extends StatsState {
  final PlayerPersonalStats stats;

  const PlayerPersonalStatsLoaded({required this.stats});
}

class StatsError extends StatsState {
  final String message;

  const StatsError(this.message);
}
