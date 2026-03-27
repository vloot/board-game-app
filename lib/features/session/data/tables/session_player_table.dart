import 'package:board_game_app/features/session/data/tables/game_session_table.dart';
import 'package:board_game_app/features/players/data/player_table.dart';
import 'package:drift/drift.dart';

class SessionPlayerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer().references(
    GameSessionTable,
    #id,
    onDelete: KeyAction.cascade,
  )();
  IntColumn get playerId => integer().references(PlayerTable, #id)();
  IntColumn get score => integer()();
  BoolColumn get isWinner => boolean()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {sessionId, playerId},
  ];
}
