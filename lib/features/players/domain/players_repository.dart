import 'player_entity.dart';

abstract class PlayerRepository {
  Future<PlayerEntity> add(PlayerEntity player);

  Future<List<PlayerEntity>> getAll();

  Future<PlayerEntity> getById(int id);

  Future<PlayerEntity> edit(PlayerEntity player);

  Future<void> delete(int id);
}
