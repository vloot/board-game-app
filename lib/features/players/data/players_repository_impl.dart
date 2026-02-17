import 'package:board_game_app/features/players/data/players_datasource.dart';
import 'package:board_game_app/features/players/data/player_model.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/domain/players_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerDatasource datasource;

  PlayerRepositoryImpl(this.datasource);

  @override
  Future<PlayerEntity> add(PlayerEntity player) async {
    final model = PlayerModel.fromEntity(player);
    final result = await datasource.add(model);
    return result.toEntity();
  }

  @override
  Future<List<PlayerEntity>> getAll() async {
    final result = await datasource.getAll();
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<PlayerEntity> getById(int id) async {
    final result = await datasource.getById(id);
    return result.toEntity();
  }

  @override
  Future<PlayerEntity> edit(PlayerEntity player) async {
    final model = PlayerModel.fromEntity(player);
    final result = await datasource.edit(model);
    return result.toEntity();
  }

  @override
  Future<void> delete(int id) async {
    await datasource.delete(id);
  }
}
