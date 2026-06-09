import 'package:board_game_app/features/stats/data/player_winrate_filter.dart';
import 'package:board_game_app/features/stats/domain/stats_repository.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_event.dart';
import 'package:board_game_app/features/stats/presentation/bloc/stats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final StatsRepository repository;

  StatsBloc(this.repository) : super(const StatsInitial()) {
    on<LoadPlayerWinrates>(_onLoadPlayerWinrates);
    on<UpdatePlayerWinrateFilter>(_onUpdatePlayerWinrateFilter);
    on<LoadBoardGameStats>(_onLoadBoardGameStats);
    on<LoadPlayerPersonalStats>(_onLoadPlayerPersonalStats);
  }

  Future<void> _onLoadPlayerWinrates(
    LoadPlayerWinrates event,
    Emitter<StatsState> emit,
  ) async {
    emit(const StatsLoading());

    try {
      final data = (await repository.getPlayerWinrates(
        event.filter.boardGameIds,
        event.filter.playerIds,
      ));

      if (data.length > 5) {
        data.removeRange(5, data.length);
      }

      emit(
        PlayerWinratesLoaded(
          winrateFilter: PlayerWinrateFilter(
            playerIds: event.filter.playerIds,
            boardGameIds: event.filter.boardGameIds,
          ),
          playerWinrates: data,
        ),
      );
    } catch (e) {
      emit(StatsError(e.toString()));
    }
  }

  Future<void> _onLoadBoardGameStats(
    LoadBoardGameStats event,
    Emitter<StatsState> emit,
  ) async {
    emit(const StatsLoading());

    try {
      final data = await repository.getBoardGameSessions(
        from: event.range?.start,
        to: event.range?.end,
      );
      emit(BoardGameStatsLoaded(boardGameStats: data, range: event.range));
    } catch (e) {
      emit(StatsError(e.toString()));
    }
  }

  Future<void> _onLoadPlayerPersonalStats(
    LoadPlayerPersonalStats event,
    Emitter<StatsState> emit,
  ) async {
    emit(const StatsLoading());

    try {
      final stats = await repository.getPlayerPersonalStats(event.playerId);
      emit(PlayerPersonalStatsLoaded(stats: stats));
    } catch (e) {
      emit(StatsError(e.toString()));
    }
  }

  Future<void> _onUpdatePlayerWinrateFilter(
    UpdatePlayerWinrateFilter event,
    Emitter<StatsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! PlayerWinratesLoaded) return;

    final updatedFilter = currentState.winrateFilter.copyWith(
      playerIds: event.playerIds,
      boardGameIds: event.boardGameIds,
    );

    try {
      final data = await repository.getPlayerWinrates(
        updatedFilter.boardGameIds,
        updatedFilter.playerIds,
      );

      emit(
        PlayerWinratesLoaded(
          winrateFilter: updatedFilter,
          playerWinrates: data,
        ),
      );
    } catch (e) {
      emit(StatsError(e.toString()));
    }
  }
}
