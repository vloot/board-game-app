import 'package:board_game_app/features/board_games/data/board_game_table.dart';
import 'package:drift/drift.dart';

class GameSessionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get playedAt => dateTime()();
  IntColumn get boardGameId => integer().references(BoardGameTable, #id)();
}
