import 'package:board_game_app/features/board_games/data/board_game_datasource.dart';
import 'package:board_game_app/features/board_games/data/board_game_model.dart';
import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/board_game_repo.dart';

class BoardGameRepoImpl implements BoardGameRepo {
  final BoardGameDatasource datasource;

  BoardGameRepoImpl(this.datasource);

  @override
  Future<BoardGameEntity> addBoardGame(BoardGameEntity boardGame) async {
    final result = await datasource.addBoardGame(
      BoardGameModel.fromEntity(boardGame),
    );
    return result.toEntity();
  }

  @override
  Future<BoardGameEntity> deleteBoardGame(BoardGameEntity boardGame) async {
    final result = await datasource.deleteBoardGame(
      BoardGameModel.fromEntity(boardGame),
    );
    return result.toEntity();
  }

  @override
  Future<BoardGameEntity> editBoardGame(BoardGameEntity boardGame) async {
    final result = await datasource.editBoardGame(
      BoardGameModel.fromEntity(boardGame),
    );
    return result.toEntity();
  }

  @override
  Future<BoardGameEntity> getBoardGame(int id) async {
    final result = await datasource.getBoardGame(id);
    return result.toEntity();
  }

  @override
  Future<List<BoardGameEntity>> getBoardGames() async {
    final result = await datasource.getBoardGames();
    return result.map((e) => e.toEntity()).toList();
  }
}
