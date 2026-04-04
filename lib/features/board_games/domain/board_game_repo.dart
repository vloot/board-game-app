import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/shared/repo_events/repository_events.dart';

abstract class BoardGameRepo {
  final RepositoryEvents repositoryEvents = RepositoryEvents();
  Future<List<BoardGameEntity>> getBoardGames();
  Future<BoardGameEntity> getBoardGame(int id);
  Future<BoardGameEntity> addBoardGame(BoardGameEntity boardGame);
  Future<BoardGameEntity> deleteBoardGame(BoardGameEntity boardGame);
  Future<BoardGameEntity> editBoardGame(BoardGameEntity boardGame);
}
