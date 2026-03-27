import 'package:board_game_app/features/session/domain/session_player_entity.dart';

abstract class SessionsEvent {}

class LoadSessions extends SessionsEvent {}

class CreateSession extends SessionsEvent {
  final int boardGameId;
  final DateTime playedAt;
  final List<SessionPlayerEntity> players;

  CreateSession({
    required this.boardGameId,
    required this.playedAt,
    required this.players,
  });
}

class DeleteSession extends SessionsEvent {
  final int sessionId;

  DeleteSession(this.sessionId);
}
