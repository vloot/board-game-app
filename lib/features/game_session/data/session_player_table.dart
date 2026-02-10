import 'package:board_game_app/features/game_session/data/game_session_table.dart';
import 'package:board_game_app/features/players/data/player_table.dart';
import 'package:drift/drift.dart';

class SessionPlayerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionID => integer().references(GameSessionTable, #id)();
  IntColumn get playerID => integer().references(PlayerTable, #id)();
  IntColumn get score => integer()();
}
