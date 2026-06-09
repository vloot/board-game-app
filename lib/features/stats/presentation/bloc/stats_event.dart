import 'package:board_game_app/features/stats/data/player_winrate_filter.dart';
import 'package:flutter/material.dart';

abstract class StatsEvent {
  const StatsEvent();
}

class LoadPlayerWinrates extends StatsEvent {
  const LoadPlayerWinrates({this.filter = const PlayerWinrateFilter()});
  final PlayerWinrateFilter filter;
}

class UpdatePlayerWinrateFilter extends StatsEvent {
  const UpdatePlayerWinrateFilter({this.playerIds, this.boardGameIds});
  final List<int>? playerIds;
  final List<int>? boardGameIds;
}

class LoadBoardGameStats extends StatsEvent {
  final DateTimeRange? range;
  const LoadBoardGameStats({this.range});
}

class LoadPlayerPersonalStats extends StatsEvent {
  final int playerId;
  const LoadPlayerPersonalStats({required this.playerId});
}
