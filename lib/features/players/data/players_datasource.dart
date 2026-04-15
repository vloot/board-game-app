import 'package:board_game_app/core/infrastructure/database.dart';
import 'player_model.dart';
import 'package:drift/drift.dart';

class PlayerDatasource {
  final Database database;

  PlayerDatasource(this.database);

  Future<PlayerModel> add(PlayerModel model) async {
    final id = await database
        .into(database.playerTable)
        .insert(model.toCompanion(isInsert: true));

    return model.copyWith(id: id);
  }

  Future<List<PlayerModel>> getAll() async {
    final result = await database.select(database.playerTable).get();
    result.where((element) => element.isDeleted == false);
    return result.map(PlayerModel.fromData).toList();
  }

  Future<PlayerModel> getById(int id) async {
    final query = database.select(database.playerTable)
      ..where((tbl) => tbl.id.equals(id));

    final result = await query.getSingle();
    return PlayerModel.fromData(result);
  }

  Future<PlayerModel> edit(PlayerModel model) async {
    await (database.update(
      database.playerTable,
    )..where((tbl) => tbl.id.equals(model.id))).write(model.toCompanion());

    return model;
  }

  Future<void> softDelete(int id) async {
    await (database.update(database.playerTable)
          ..where((tbl) => tbl.id.equals(id)))
        .write(PlayerTableCompanion(isDeleted: Value(true)));
  }

  Future<void> delete(int id) async {
    await (database.delete(
      database.playerTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }
}
