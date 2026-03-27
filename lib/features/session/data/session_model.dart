import 'package:board_game_app/features/session/data/session_player_model.dart';
import 'package:board_game_app/features/session/domain/session_entity.dart';

class SessionModel {
  final int? id;
  final int boardGameId;
  final DateTime date;
  final List<SessionPlayerModel> players;

  SessionModel({
    this.id,
    required this.boardGameId,
    required this.date,
    required this.players,
  });

  SessionEntity toEntity() {
    return SessionEntity(
      id: id,
      boardGameId: boardGameId,
      date: date,
      players: players.map((p) => p.toEntity()).toList(),
    );
  }

  factory SessionModel.fromEntity(SessionEntity entity) {
    return SessionModel(
      id: entity.id,
      boardGameId: entity.boardGameId,
      date: entity.date,
      players: entity.players
          .map((p) => SessionPlayerModel.fromEntity(p))
          .toList(),
    );
  }

  SessionModel copyWith({
    int? id,
    int? boardGameId,
    DateTime? date,
    List<SessionPlayerModel>? players,
  }) {
    return SessionModel(
      id: id ?? this.id,
      boardGameId: boardGameId ?? this.boardGameId,
      date: date ?? this.date,
      players: players ?? this.players,
    );
  }
}
