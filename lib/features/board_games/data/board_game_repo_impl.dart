import 'package:board_game_app/features/board_games/data/board_game_datasource.dart';
import 'package:board_game_app/features/board_games/data/board_game_model.dart';
import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/board_game_repo.dart';

class BoardGameRepoImpl extends BoardGameRepo {
  final BoardGameDatasource datasource;

  BoardGameRepoImpl(this.datasource);

  @override
  Future<BoardGameEntity> addBoardGame(BoardGameEntity boardGame) async {
    final result = await datasource.addBoardGame(
      BoardGameModel.fromEntity(boardGame),
    );
    repositoryEvents.notify();
    return result.toEntity();
  }

  @override
  Future<BoardGameEntity> deleteBoardGame(
    BoardGameEntity boardGame, {
    bool softDelete = true,
  }) async {
    final BoardGameModel boardGameModel;
    if (softDelete) {
      boardGameModel = await datasource.softDeleteBoardGame(
        BoardGameModel.fromEntity(boardGame),
      );
    } else {
      boardGameModel = await datasource.deleteBoardGame(
        BoardGameModel.fromEntity(boardGame),
      );
    }

    repositoryEvents.notify();
    return boardGameModel.toEntity();
  }

  @override
  Future<BoardGameEntity> editBoardGame(BoardGameEntity boardGame) async {
    final result = await datasource.editBoardGame(
      BoardGameModel.fromEntity(boardGame),
    );
    repositoryEvents.notify();
    return result.toEntity();
  }

  @override
  Future<BoardGameEntity> getBoardGame(int id) async {
    final result = await datasource.getBoardGame(id);
    return result.toEntity();
  }

  @override
  Future<List<BoardGameEntity>> getBoardGames({withDeleted = false}) async {
    final result = await datasource.getBoardGames();
    if (!withDeleted) {
      return result
          .where((e) => e.isDeleted == false)
          .map((e) => e.toEntity())
          .toList();
    }
    return result.map((e) => e.toEntity()).toList();
  }
}
