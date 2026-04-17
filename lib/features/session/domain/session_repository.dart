import 'package:board_game_app/features/session/domain/session_entity.dart';
import 'package:board_game_app/features/session/domain/session_player_entity.dart';

abstract class SessionRepository {
  Future<int> createSession({
    required int boardGameId,
    required DateTime playedAt,
    required List<SessionPlayerEntity> players,
  });

  Future<void> addPlayersToSession({
    required int sessionId,
    required List<SessionPlayerEntity> players,
  });

  Future<SessionEntity?> getSession(int sessionId);

  Future<List<SessionEntity>> getSessions();

  Future<void> deleteSession(int sessionId);

  Future<void> updateSession(SessionEntity session);
}
