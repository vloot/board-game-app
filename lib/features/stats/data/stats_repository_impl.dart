import 'package:board_game_app/features/stats/data/datasource/stats_datasource.dart';
import 'package:board_game_app/features/stats/domain/board_game_stat.dart';
import 'package:board_game_app/features/stats/domain/player_personal_stats.dart';
import 'package:board_game_app/features/stats/domain/player_winrate.dart';
import 'package:board_game_app/features/stats/domain/stats_repository.dart';

class StatsRepositoryImpl implements StatsRepository {
  final StatsDatasource datasource;

  StatsRepositoryImpl(this.datasource);

  @override
  Future<List<PlayerWinrateEntity>> getPlayerWinrates(
    List<int> boardGameIds,
    List<int> playerIds,
  ) {
    return datasource.getPlayerWinrates(boardGameIds, playerIds);
  }

  @override
  Future<List<BoardGameStatEntity>> getBoardGameSessions({
    DateTime? from,
    DateTime? to,
  }) {
    return datasource.getBoardGameSessions(from: from, to: to);
  }

  @override
  Future<PlayerPersonalStats> getPlayerPersonalStats(int playerId) {
    return datasource.getPlayerPersonalStats(playerId);
  }
}
