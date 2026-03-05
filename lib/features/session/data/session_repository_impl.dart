import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/board_game_repo.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/domain/players_repository.dart';
import 'package:board_game_app/features/session/data/session_creation_data.dart';
import 'package:board_game_app/features/session/domain/session_repository.dart';

class SessionRepositoryImpl implements SessionRepository {
  final PlayerRepository playerRepo;
  final BoardGameRepo gameRepo;

  SessionRepositoryImpl({required this.playerRepo, required this.gameRepo});

  @override
  Future<SessionCreationData> loadCreationData() async {
    final results = await Future.wait([
      playerRepo.getAll(),
      gameRepo.getBoardGames(),
    ]);

    return SessionCreationData(
      players: results[0] as List<PlayerEntity>,
      games: results[1] as List<BoardGameEntity>,
    );
  }
}
