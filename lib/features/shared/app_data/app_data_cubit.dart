import 'package:board_game_app/features/board_games/domain/board_game_entity.dart';
import 'package:board_game_app/features/board_games/domain/board_game_repo.dart';
import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/players/domain/players_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDataState {
  final List<PlayerEntity> players;
  final Map<int, PlayerEntity> playersById;

  final List<BoardGameEntity> games;
  final Map<int, BoardGameEntity> gamesById;

  final bool isLoading;
  final bool isLoaded;

  const AppDataState({
    this.players = const [],
    this.playersById = const {},
    this.games = const [],
    this.gamesById = const {},
    this.isLoading = false,
    this.isLoaded = false,
  });

  AppDataState copyWith({
    List<PlayerEntity>? players,
    Map<int, PlayerEntity>? playersById,
    List<BoardGameEntity>? games,
    Map<int, BoardGameEntity>? gamesById,
    bool? isLoading,
    bool? isLoaded,
  }) {
    return AppDataState(
      players: players ?? this.players,
      playersById: playersById ?? this.playersById,
      games: games ?? this.games,
      gamesById: gamesById ?? this.gamesById,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

class AppDataCubit extends Cubit<AppDataState> {
  final PlayerRepository playerRepo;
  final BoardGameRepo gameRepo;

  AppDataCubit(this.playerRepo, this.gameRepo) : super(const AppDataState());

  Future<void> load({bool force = false}) async {
    if (state.isLoading) return;
    if (state.isLoaded && !force) return;

    emit(state.copyWith(isLoading: true));

    try {
      final results = await Future.wait([
        playerRepo.getAll(),
        gameRepo.getBoardGames(),
      ]);

      final players = results[0] as List<PlayerEntity>;
      final games = results[1] as List<BoardGameEntity>;

      emit(
        state.copyWith(
          players: players,
          playersById: {for (final p in players) p.id: p},
          games: games,
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
