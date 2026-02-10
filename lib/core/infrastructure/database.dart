import 'package:board_game_app/features/board_games/data/board_game_table.dart';
import 'package:board_game_app/features/game_session/data/game_session_table.dart';
import 'package:board_game_app/features/game_session/data/session_player_table.dart';
import 'package:board_game_app/features/players/data/player_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [BoardGameTable, PlayerTable, GameSessionTable, SessionPlayerTable],
)
class Database extends _$Database {
  Database([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'bgAppDB',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
