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
  }

  Future<void> _onLoadPlayerWinrates(
    LoadPlayerWinrates event,
    Emitter<StatsState> emit,
  ) async {
    emit(const StatsLoading());

    try {
      final data = await repository.getPlayerWinrates(
        event.filter.boardGameIds,
        event.filter.playerIds,
      );

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
