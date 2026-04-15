import 'package:board_game_app/features/board_games/domain/player_count.dart';

class BoardGameEntity {
  final int id;
  final PlayerCount playerCount;
  final String name;
  final int color;
  final bool isDeleted;

  BoardGameEntity({
    this.id = -1,
    required this.playerCount,
    required this.name,
    required this.color,
    this.isDeleted = false,
  });
}
