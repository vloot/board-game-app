import 'package:board_game_app/features/session/data/datasource/session_datasource.dart';
import 'package:board_game_app/features/session/data/session_creation_data.dart';
import 'package:board_game_app/features/session/data/session_player_model.dart';
import 'package:board_game_app/features/session/domain/session_entity.dart';
import 'package:board_game_app/features/session/domain/session_player_entity.dart';
import 'package:board_game_app/features/session/domain/session_repository.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionDataSource localDatasource;

  SessionRepositoryImpl(this.localDatasource);

  @override
  Future<int> createSession({
    required int boardGameId,
    required DateTime playedAt,
    required List<SessionPlayerEntity> players,
  }) {
    return localDatasource.createSession(
      boardGameId: boardGameId,
      playedAt: playedAt,
      players: playersFromEntities(players),
    );
  }

  @override
  Future<void> addPlayersToSession({
    required int sessionId,
    required List<SessionPlayerEntity> players,
  }) {
    return localDatasource.addPlayersToSession(
      sessionId: sessionId,
      players: playersFromEntities(players),
    );
  }

  @override
  Future<void> deleteSession(int sessionId) {
    return localDatasource.deleteSession(sessionId);
  }

  @override
  Future<List<SessionEntity>> getSessions() async {
    var modelsList = await localDatasource.getSessions();
    return modelsList.map((e) => e.toEntity()).toList();
  }

  @override
  Future<SessionEntity?> getSession(int sessionId) {
    // TODO: implement getSession
    throw UnimplementedError();
  }

  @override
  Future<SessionCreationData> loadCreationData() {
    // TODO: implement loadCreationData
    throw UnimplementedError();
  }

  @override
  Future<void> removePlayerFromSession(int playerId) {
    // TODO: implement removePlayerFromSession
    throw UnimplementedError();
  }

  @override
  Future<void> updateSessionPlayer({
    required int sessionId,
    required playerId,
    required int score,
    required bool isWinner,
  }) {
    // TODO: implement updateSessionPlayer
    throw UnimplementedError();
  }

  List<SessionPlayerModel> playersFromEntities(
    List<SessionPlayerEntity> entities,
  ) {
    return entities.map((e) => SessionPlayerModel.fromEntity(e)).toList();
  }
}
