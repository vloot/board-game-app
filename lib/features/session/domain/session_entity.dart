import 'package:board_game_app/features/session/domain/session_player_entity.dart';

class SessionEntity {
  final int? id;
  final int boardGameId;
  final DateTime playedAt;
  final List<SessionPlayerEntity> players;

  SessionEntity({
    this.id,
    required this.boardGameId,
    required this.playedAt,
    required this.players,
  });
}
