import 'package:board_game_app/features/session/data/session_model.dart';
import 'package:board_game_app/features/session/data/session_player_model.dart';

abstract class SessionDataSource {
  Future<int> createSession({
    required int boardGameId,
    required DateTime playedAt,
    required List<SessionPlayerModel> players,
  });

  Future<void> addPlayersToSession({
    required int sessionId,
    required List<SessionPlayerModel> players,
  });

  Future<List<SessionModel>> getSessions();

  Future<SessionModel?> getSession(int id);

  Future<void> deleteSession(int sessionId);

  Future<void> updateSession({
    required SessionModel sessionModel,
    required List<SessionPlayerModel> sessionPlayers,
  });
}
