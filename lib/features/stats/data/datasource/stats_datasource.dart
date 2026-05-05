import 'package:board_game_app/core/infrastructure/database.dart';
import 'package:board_game_app/features/stats/domain/player_winrate.dart';
import 'package:drift/drift.dart';

class StatsDatasource {
  final Database db;

  StatsDatasource({required this.db});

  Future<List<PlayerWinrateEntity>> getPlayerWinrates(
    List<int> boardGameIds,
    List<int> playerIds,
  ) async {
    final conditions = <String>[];
    final vars = <Variable>[];

    if (boardGameIds.isNotEmpty) {
      conditions.add(
        's.board_game_id IN (${boardGameIds.map((_) => '?').join(',')})',
      );

      vars.addAll(boardGameIds.map((id) => Variable<int>(id)));
    }

    if (playerIds.isNotEmpty) {
      conditions.add(
        'sp.player_id IN (${playerIds.map((_) => '?').join(',')})',
      );

      vars.addAll(playerIds.map((id) => Variable<int>(id)));
    }

    final whereClause = conditions.isEmpty
        ? ''
        : 'WHERE ${conditions.join(' AND ')}';

    final rows = await db
        .customSelect(
          '''
            SELECT
              sp.player_id AS playerId,
              p.name AS playerName,
              COUNT(*) AS gamesPlayed,
              SUM(
                CASE
                  WHEN sp.is_winner = 1 THEN 1
                  ELSE 0
                END
              ) AS wins
            FROM session_player_table sp
            INNER JOIN player_table p
              ON p.id = sp.player_id
            INNER JOIN game_session_table s
              ON s.id = sp.session_id

            $whereClause

            GROUP BY sp.player_id, p.name
            HAVING COUNT(*) > 0
            ORDER BY gamesPlayed DESC, wins DESC, p.name ASC
          ''',
          variables: vars,
          readsFrom: {
            db.sessionPlayerTable,
            db.playerTable,
            db.gameSessionTable,
          },
        )
        .get();

    var res = rows.map((row) {
      final gamesPlayed = row.read<int>('gamesPlayed');
      final wins = row.read<int>('wins');

      return PlayerWinrateEntity(
        playerId: row.read<int>('playerId'),
        wins: wins,
        gamesPlayed: gamesPlayed,
        winrate: gamesPlayed == 0 ? 0 : (wins / gamesPlayed) * 100,
      );
    });

    return res.toList();
  }
}
