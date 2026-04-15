import 'package:board_game_app/core/infrastructure/database.dart';
import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/player_count.dart';
import 'package:drift/drift.dart';

class BoardGameModel {
  final int id;
  final int minPlayer;
  final int maxPlayer;
  final String name;
  final int color;
  final bool isDeleted;

  BoardGameModel({
    required this.id,
    required this.minPlayer,
    required this.maxPlayer,
    required this.name,
    required this.color,
    this.isDeleted = false,
  });

  BoardGameModel copyWith({
    int? id,
    int? minPlayer,
    int? maxPlayer,
    String? name,
    int? color,
    bool? isDeleted,
  }) {
    return BoardGameModel(
      id: id ?? this.id,
      minPlayer: minPlayer ?? this.minPlayer,
      maxPlayer: maxPlayer ?? this.maxPlayer,
      name: name ?? this.name,
      color: color ?? this.color,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  BoardGameEntity toEntity() {
    return BoardGameEntity(
      id: id,
      name: name,
      color: color,
      playerCount: PlayerCount(min: minPlayer, max: maxPlayer),
      isDeleted: isDeleted,
    );
  }

  factory BoardGameModel.fromEntity(BoardGameEntity entity) {
    return BoardGameModel(
      id: entity.id,
      name: entity.name,
      color: entity.color,
      minPlayer: entity.playerCount.min,
      maxPlayer: entity.playerCount.max,
      isDeleted: entity.isDeleted,
    );
  }

  BoardGameTableCompanion toCompanion() {
    return BoardGameTableCompanion(
      id: id != -1 ? Value(id) : Value.absent(),
      name: Value(name),
      minPlayerCount: Value(minPlayer),
      maxPlayerCount: Value(maxPlayer),
      color: Value(color),
      isDeleted: Value(isDeleted),
    );
  }

  factory BoardGameModel.fromTable(BoardGameTableData data) {
    return BoardGameModel(
      id: data.id,
      minPlayer: data.minPlayerCount,
      maxPlayer: data.maxPlayerCount,
      name: data.name,
      color: data.color,
      isDeleted: data.isDeleted,
    );
  }
}
