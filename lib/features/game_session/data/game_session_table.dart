import 'package:board_game_app/features/board_games/data/board_game_table.dart';
import 'package:board_game_app/features/players/data/player_table.dart';
import 'package:drift/drift.dart';

class GameSessionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get time => dateTime()();
  IntColumn get boardGameID => integer().references(BoardGameTable, #id)();
  IntColumn get winnerPlayerID => integer().references(PlayerTable, #id)();
}
