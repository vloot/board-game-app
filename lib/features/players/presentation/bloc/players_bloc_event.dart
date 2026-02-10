import 'package:board_game_app/features/players/domain/player_entity.dart';

abstract class PlayerEvent {}

class LoadPlayers extends PlayerEvent {}

class GetPlayerById extends PlayerEvent {
  final int id;
  GetPlayerById(this.id);
}

class AddPlayer extends PlayerEvent {
  final PlayerEntity player;
  AddPlayer(this.player);
}

class EditPlayer extends PlayerEvent {
  final PlayerEntity player;
  EditPlayer(this.player);
}

class DeletePlayer extends PlayerEvent {
  final int id;
  DeletePlayer(this.id);
}
