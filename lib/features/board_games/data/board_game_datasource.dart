import 'package:board_game_app/core/infrastructure/database.dart';
import 'package:board_game_app/features/board_games/data/board_game_model.dart';

class BoardGameDatasource {
  final Database database;

  BoardGameDatasource(this.database);

  Future<BoardGameModel> addBoardGame(BoardGameModel boardGame) async {
    final id = await database
        .into(database.boardGameTable)
        .insert(boardGame.toCompanion());

    return boardGame.copyWith(id: id);
  }

  Future<BoardGameModel> deleteBoardGame(BoardGameModel boardGameModel) async {
    await (database.delete(
      database.boardGameTable,
    )..where((tbl) => tbl.id.equals(boardGameModel.id))).go();

    return boardGameModel;
  }

  Future<BoardGameModel> editBoardGame(BoardGameModel boardGameModel) async {
    await (database.update(database.boardGameTable)
          ..where((tbl) => tbl.id.equals(boardGameModel.id)))
        .write(boardGameModel.toCompanion());

    return boardGameModel;
  }

  Future<BoardGameModel> getBoardGame(int id) async {
    final row = await (database.select(
      database.boardGameTable,
    )..where((tbl) => tbl.id.equals(id))).getSingle();

    return BoardGameModel.fromTable(row);
  }

  Future<List<BoardGameModel>> getBoardGames() async {
    final rows = await database.select(database.boardGameTable).get();

    return rows.map(BoardGameModel.fromTable).toList();
  }
}
