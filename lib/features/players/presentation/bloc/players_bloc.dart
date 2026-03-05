import 'package:board_game_app/features/players/domain/players_repository.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_event.dart';
import 'package:board_game_app/features/players/presentation/bloc/players_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final PlayerRepository repo;

  PlayerBloc(this.repo) : super(PlayerInit()) {
    on<GetPlayers>(_onLoadPlayers);
    on<GetPlayerById>(_onGetById);
    on<AddPlayer>(_onAdd);
    on<EditPlayer>(_onEdit);
    on<DeletePlayer>(_onDelete);
  }

  Future<void> _onLoadPlayers(
    GetPlayers event,
    Emitter<PlayerState> emit,
  ) async {
    emit(PlayerLoading());
    try {
      final players = await repo.getAll();
      emit(PlayersLoaded(players));
    } catch (e) {
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onGetById(
    GetPlayerById event,
    Emitter<PlayerState> emit,
  ) async {
    emit(PlayerLoading());
    try {
      final player = await repo.getById(event.id);
      emit(PlayerLoadedSingle(player));
    } catch (e) {
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onAdd(AddPlayer event, Emitter<PlayerState> emit) async {
    emit(PlayerLoading());
    try {
      final player = await repo.add(event.player);
      emit(PlayerAdded(player));
    } catch (e) {
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onEdit(EditPlayer event, Emitter<PlayerState> emit) async {
    emit(PlayerLoading());
    try {
      final player = await repo.edit(event.player);
      emit(PlayerEdited(player));
    } catch (e) {
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onDelete(DeletePlayer event, Emitter<PlayerState> emit) async {
    emit(PlayerLoading());
    try {
      await repo.delete(event.id);
      emit(PlayerDeleted());
    } catch (e) {
      emit(PlayerError(e.toString()));
    }
  }
}
