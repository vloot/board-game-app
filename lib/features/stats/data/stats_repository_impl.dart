import 'package:board_game_app/features/stats/data/datasource/stats_datasource.dart';
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
}
