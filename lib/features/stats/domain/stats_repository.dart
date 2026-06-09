import 'package:board_game_app/features/stats/domain/board_game_stat.dart';
import 'package:board_game_app/features/stats/domain/player_personal_stats.dart';
import 'package:board_game_app/features/stats/domain/player_winrate.dart';

abstract class StatsRepository {
  Future<List<PlayerWinrateEntity>> getPlayerWinrates(
    List<int> boardGameIds,
    List<int> playerIds,
  );

  Future<List<BoardGameStatEntity>> getBoardGameSessions({
    DateTime? from,
    DateTime? to,
  });

  Future<PlayerPersonalStats> getPlayerPersonalStats(int playerId);
}
