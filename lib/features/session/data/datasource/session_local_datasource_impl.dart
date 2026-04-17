import 'package:board_game_app/core/infrastructure/database.dart';
import 'package:board_game_app/features/session/data/datasource/session_datasource.dart';
import 'package:board_game_app/features/session/data/session_model.dart';
import 'package:board_game_app/features/session/data/session_player_model.dart';
import 'package:drift/drift.dart';

class SessionLocalDataSourceImpl implements SessionDataSource {
  final Database db;

  SessionLocalDataSourceImpl(this.db);

  @override
  Future<int> createSession({
    required int boardGameId,
    required DateTime playedAt,
    required List<SessionPlayerModel> players,
  }) async {
    return await db.transaction(() async {
      final sessionId = await db
          .into(db.gameSessionTable)
          .insert(
            GameSessionTableCompanion.insert(
              boardGameId: boardGameId,
              playedAt: playedAt,
            ),
          );

      await addPlayersToSession(sessionId: sessionId, players: players);

      return sessionId;
    });
  }

  @override
  Future<void> updateSession({
    required SessionModel sessionModel,
    required List<SessionPlayerModel> sessionPlayers,
  }) async {
    await db.transaction(() async {
      // Update main session row
      await (db.update(
        db.gameSessionTable,
      )..where((t) => t.id.equals(sessionModel.id!))).write(
        GameSessionTableCompanion(
          boardGameId: Value(sessionModel.boardGameId),
          playedAt: Value(sessionModel.playedAt),
        ),
      );

      // Remove previous players
      await (db.delete(
        db.sessionPlayerTable,
      )..where((t) => t.sessionId.equals(sessionModel.id!))).go();

      // Insert updated players
      await db.batch((batch) {
        batch.insertAll(
          db.sessionPlayerTable,
          sessionPlayers.map((p) {
            return SessionPlayerTableCompanion.insert(
              sessionId: p.sessionId ?? sessionModel.id!,
              playerId: p.playerId,
              score: p.score,
              isWinner: p.isWinner,
            );
          }).toList(),
        );
      });
    });
  }

  @override
  Future<void> addPlayersToSession({
    required int sessionId,
    required List<SessionPlayerModel> players,
  }) async {
    if (players.isEmpty) return;

    await db.batch((batch) {
      batch.insertAll(
        db.sessionPlayerTable,
        players.map((player) {
          return SessionPlayerTableCompanion.insert(
            playerId: player.playerId,
            sessionId: sessionId,
            score: player.score,
            isWinner: player.isWinner,
          );
        }).toList(),
      );
    });
  }

  @override
  Future<List<SessionModel>> getSessions() async {
    final sessionRows = await db.select(db.gameSessionTable).get();

    if (sessionRows.isEmpty) return [];

    final sessionIds = sessionRows.map((s) => s.id).toList();

    final playerRows = await (db.select(
      db.sessionPlayerTable,
    )..where((t) => t.sessionId.isIn(sessionIds))).get();

    // Group players by sessionId
    final playersBySession = <int, List<SessionPlayerModel>>{};

    for (final p in playerRows) {
      playersBySession
          .putIfAbsent(p.sessionId, () => [])
          .add(
            SessionPlayerModel(
              sessionId: p.sessionId,
              playerId: p.playerId,
              score: p.score,
              isWinner: p.isWinner,
            ),
          );
    }

    return sessionRows.map((s) {
      return SessionModel(
        id: s.id,
        boardGameId: s.boardGameId,
        playedAt: s.playedAt,
        players: playersBySession[s.id] ?? [],
      );
    }).toList();
  }

  @override
  Future<void> deleteSession(int sessionId) async {
    await db.transaction(() async {
      // delete session players
      await (db.delete(
        db.sessionPlayerTable,
      )..where((t) => t.sessionId.equals(sessionId))).go();

      // delete session
      await (db.delete(
        db.gameSessionTable,
      )..where((t) => t.id.equals(sessionId))).go();
    });
  }

  @override
  Future<SessionModel> getSession(int id) async {
    final query = (db.select(db.gameSessionTable)
      ..where((tbl) => tbl.id.equals(id)));

    final playerRows = await (db.select(
      db.sessionPlayerTable,
    )..where((t) => t.sessionId.equals(id))).get();

    final res = await query.getSingle();
    return SessionModel(
      boardGameId: res.id,
      playedAt: res.playedAt,
      players: playerRows
          .map(
            (e) => SessionPlayerModel(
              playerId: e.playerId,
              sessionId: e.sessionId,
              score: e.score,
              isWinner: e.isWinner,
            ),
          )
          .toList(),
    );
  }
}
