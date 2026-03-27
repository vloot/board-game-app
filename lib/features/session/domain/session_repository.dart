import 'package:board_game_app/features/session/data/session_creation_data.dart';
import 'package:board_game_app/features/session/domain/session_entity.dart';
import 'package:board_game_app/features/session/domain/session_player_entity.dart';

abstract class SessionRepository {
  Future<SessionCreationData> loadCreationData();

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

  Future<void> updateSessionPlayer({
    required int sessionId,
    required playerId,
    required int score,
    required bool isWinner,
  });

  Future<void> deleteSession(int sessionId);

  Future<void> removePlayerFromSession(int playerId);
}
