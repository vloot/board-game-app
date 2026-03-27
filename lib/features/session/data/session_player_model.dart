import 'package:board_game_app/features/session/domain/session_player_entity.dart';

class SessionPlayerModel {
  final int playerId;
  final int? sessionId;
  final int score;
  final bool isWinner;

  SessionPlayerModel({
    required this.playerId,
    required this.sessionId,
    required this.score,
    required this.isWinner,
  });

  SessionPlayerEntity toEntity() => SessionPlayerEntity(
    playerId: playerId,
    score: score,
    isWinner: isWinner,
    sessionId: sessionId,
  );

  factory SessionPlayerModel.fromEntity(SessionPlayerEntity e) {
    return SessionPlayerModel(
      playerId: e.playerId,
      sessionId: e.sessionId,
      score: e.score,
      isWinner: e.isWinner,
    );
  }
}
