import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';

class SessionCreationData {
  final List<PlayerEntity> players;
  final List<BoardGameEntity> games;

  SessionCreationData({required this.players, required this.games});
}
