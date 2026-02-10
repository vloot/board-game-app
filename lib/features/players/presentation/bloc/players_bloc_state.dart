import 'package:board_game_app/features/players/domain/player_entity.dart';

abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

class PlayerLoading extends PlayerState {}

class PlayerLoadedAll extends PlayerState {
  final List<PlayerEntity> players;
  PlayerLoadedAll(this.players);
}

class PlayerLoadedSingle extends PlayerState {
  final PlayerEntity player;
  PlayerLoadedSingle(this.player);
}

class PlayerAdded extends PlayerState {
  final PlayerEntity player;
  PlayerAdded(this.player);
}

class PlayerEdited extends PlayerState {
  final PlayerEntity player;
  PlayerEdited(this.player);
}

class PlayerDeleted extends PlayerState {}

class PlayerError extends PlayerState {
  final String message;
  PlayerError(this.message);
}
