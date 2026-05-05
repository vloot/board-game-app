import 'package:board_game_app/features/stats/domain/player_winrate.dart';

abstract class StatsRepository {
  Future<List<PlayerWinrateEntity>> getPlayerWinrates(
    List<int> boardGameIds,
    List<int> playerIds,
  );
}
