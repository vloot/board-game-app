import 'package:board_game_app/core/infrastructure/database.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:drift/drift.dart';

class PlayerModel {
  final int id;
  final String name;
  final int color;

  PlayerModel({required this.id, required this.name, required this.color});

  /// From Drift data class
  factory PlayerModel.fromData(PlayerTableData data) {
    return PlayerModel(id: data.id, name: data.name, color: data.color);
  }

  /// To Drift companion (for insert/update)
  PlayerTableCompanion toCompanion({bool isInsert = false}) {
    return PlayerTableCompanion(
      id: isInsert ? const Value.absent() : Value(id),
      name: Value(name),
      color: Value(color),
    );
  }

  /// From Entity
  factory PlayerModel.fromEntity(PlayerEntity entity) {
    return PlayerModel(id: entity.id, name: entity.name, color: entity.color);
  }

  /// To Entity
  PlayerEntity toEntity() {
    return PlayerEntity(id: id, name: name, color: color);
  }

  PlayerModel copyWith({int? id, String? name, int? color}) {
    return PlayerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}
