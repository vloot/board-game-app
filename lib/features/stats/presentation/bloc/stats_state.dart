import 'package:board_game_app/features/stats/data/player_winrate_filter.dart';
import 'package:board_game_app/features/stats/domain/player_winrate.dart';

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

class StatsError extends StatsState {
  final String message;

  const StatsError(this.message);
}
