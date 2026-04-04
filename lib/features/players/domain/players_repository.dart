import 'package:board_game_app/features/shared/repo_events/repository_events.dart';

import 'player_entity.dart';

abstract class PlayerRepository {
  final RepositoryEvents repositoryEvents = RepositoryEvents();

  Future<PlayerEntity> add(PlayerEntity player);

  Future<List<PlayerEntity>> getAll();

  Future<PlayerEntity> getById(int id);

  Future<PlayerEntity> edit(PlayerEntity player);

  Future<void> delete(int id);
}
