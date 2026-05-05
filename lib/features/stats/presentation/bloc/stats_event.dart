import 'package:board_game_app/features/stats/data/player_winrate_filter.dart';

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
