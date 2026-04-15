import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/board_game_repo.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/domain/players_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDataState {
  final List<PlayerEntity> allPlayers;
  final List<PlayerEntity> activePlayers;
  final Map<int, PlayerEntity> playersById;

  final List<BoardGameEntity> allGames;
  final List<BoardGameEntity> activeGames;
  final Map<int, BoardGameEntity> gamesById;

  final bool isLoading;
  final bool isLoaded;

  const AppDataState({
    this.allPlayers = const [],
    this.activePlayers = const [],
    this.playersById = const {},
    this.allGames = const [],
    this.activeGames = const [],
    this.gamesById = const {},
    this.isLoading = false,
    this.isLoaded = false,
  });

  AppDataState copyWith({
    List<PlayerEntity>? allPlayers,
    List<PlayerEntity>? activePlayers,
    Map<int, PlayerEntity>? playersById,
    List<BoardGameEntity>? allGames,
    List<BoardGameEntity>? activeGames,
    Map<int, BoardGameEntity>? gamesById,
    bool? isLoading,
    bool? isLoaded,
  }) {
    return AppDataState(
      allPlayers: allPlayers ?? this.allPlayers,
      activePlayers: activePlayers ?? this.activePlayers,
      playersById: playersById ?? this.playersById,
      allGames: allGames ?? this.allGames,
      activeGames: activeGames ?? this.activeGames,
      gamesById: gamesById ?? this.gamesById,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

class AppDataCubit extends Cubit<AppDataState> {
  final PlayerRepository playerRepo;
  final BoardGameRepo gameRepo;

  AppDataCubit(this.playerRepo, this.gameRepo) : super(const AppDataState()) {
    playerRepo.repositoryEvents.subscribe(((_) {
      load(force: true);
    }));

    gameRepo.repositoryEvents.subscribe(((_) {
      load(force: true);
    }));
  }

  Future<void> load({bool force = false}) async {
    if (state.isLoading) return;
    if (state.isLoaded && !force) return;

    emit(state.copyWith(isLoading: true));

    try {
      final results = await Future.wait([
        playerRepo.getAll(withDeleted: true),
        gameRepo.getBoardGames(withDeleted: true),
      ]);

      final players = results[0] as List<PlayerEntity>;
      final games = results[1] as List<BoardGameEntity>;

      emit(
        state.copyWith(
          allPlayers: players,
          activePlayers: players.where((p) => !p.isDeleted).toList(),
          playersById: {for (final p in players) p.id: p},
          allGames: games,
          activeGames: games.where((g) => !g.isDeleted).toList(),
          gamesById: {for (final g in games) g.id: g},
          isLoading: false,
          isLoaded: true,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      rethrow;
    }
  }
}
