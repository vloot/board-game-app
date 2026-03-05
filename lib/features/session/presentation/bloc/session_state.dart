import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';

abstract class SessionFormState {}

class SessionFormLoading extends SessionFormState {}

class SessionFormLoaded extends SessionFormState {
  final List<PlayerEntity> players;
  final List<BoardGameEntity> boardGames;

  SessionFormLoaded({required this.players, required this.boardGames});
}

class SessionFormError extends SessionFormState {
  final String message;

  SessionFormError(this.message);
}
