import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';

abstract class BoardGameRepo {
  Future<List<BoardGameEntity>> getBoardGames();
  Future<BoardGameEntity> getBoardGame(int id);
  Future<BoardGameEntity> addBoardGame(BoardGameEntity boardGame);
  Future<BoardGameEntity> deleteBoardGame(BoardGameEntity boardGame);
  Future<BoardGameEntity> editBoardGame(BoardGameEntity boardGame);
}
