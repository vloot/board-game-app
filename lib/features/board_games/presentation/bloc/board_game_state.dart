import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';

class BoardGameState {}

class BoardGameLoadAllState implements BoardGameState {
  final List<BoardGameEntity> boardGames;

  BoardGameLoadAllState({required this.boardGames});
}

class BoardGameLoadedState implements BoardGameState {
  final BoardGameEntity boardGame;

  BoardGameLoadedState({required this.boardGame});
}

class BoardGameAddedState implements BoardGameState {
  final BoardGameEntity boardGame;

  BoardGameAddedState({required this.boardGame});
}

class BoardGameDeletedState implements BoardGameState {
  final BoardGameEntity boardGame;

  BoardGameDeletedState({required this.boardGame});
}

class BoardGameEditedState implements BoardGameState {
  final BoardGameEntity boardGame;

  BoardGameEditedState({required this.boardGame});
}

class BoardGameErrorState implements BoardGameState {
  final String msg;

  BoardGameErrorState(this.msg);
}
