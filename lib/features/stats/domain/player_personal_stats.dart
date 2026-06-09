import 'package:board_game_app/features/stats/domain/board_game_stat.dart';

class PlayerPersonalStats {
  final int playerId;
  final int gamesPlayed;
  final int wins;
  final List<BoardGameStatEntity> playedGames;

  PlayerPersonalStats({
    required this.playerId,
    required this.gamesPlayed,
    required this.wins,
    required this.playedGames,
  });
}
