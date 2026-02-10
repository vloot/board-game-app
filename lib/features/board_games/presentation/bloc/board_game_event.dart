import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';

abstract class BoardGameEvent {}

class LoadBoardGames extends BoardGameEvent {}

class LoadBoardGame extends BoardGameEvent {
  final int id;

  LoadBoardGame(this.id);
}

class AddBoardGame extends BoardGameEvent {
  final BoardGameEntity boardGame;

  AddBoardGame(this.boardGame);
}

class EditBoardGame extends BoardGameEvent {
  final BoardGameEntity boardGame;

  EditBoardGame(this.boardGame);
}

class RemoveBoardGame extends BoardGameEvent {
  final BoardGameEntity boardGame;

  RemoveBoardGame(this.boardGame);
}
