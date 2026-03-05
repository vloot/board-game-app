import 'package:board_game_app/features/session/data/session_creation_data.dart';

abstract class SessionRepository {
  Future<SessionCreationData> loadCreationData();
}
