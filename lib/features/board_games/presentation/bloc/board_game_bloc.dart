import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:board_game_app/features/board_games/domain/board_game_repo.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_event.dart';
import 'package:board_game_app/features/board_games/presentation/bloc/board_game_state.dart';

class BoardGameBloc extends Bloc<BoardGameEvent, BoardGameState> {
  final BoardGameRepo repo;

  BoardGameBloc(this.repo) : super(BoardGameLoadAllState(boardGames: [])) {
    on<LoadBoardGames>(_onLoadAll);
    on<LoadBoardGame>(_onLoadOne);
    on<AddBoardGame>(_onAdd);
    on<EditBoardGame>(_onEdit);
    on<DeleteBoardGame>(_onDelete);
  }

  Future<void> _onLoadAll(
    LoadBoardGames event,
    Emitter<BoardGameState> emit,
  ) async {
    try {
      final games = await repo.getBoardGames();
      emit(BoardGameLoadAllState(boardGames: games));
    } catch (e) {
      emit(BoardGameErrorState(e.toString()));
    }
  }

  Future<void> _onLoadOne(
    LoadBoardGame event,
    Emitter<BoardGameState> emit,
  ) async {
    try {
      final game = await repo.getBoardGame(event.id);
      emit(BoardGameLoadedState(boardGame: game));
    } catch (e) {
      emit(BoardGameErrorState(e.toString()));
    }
  }

  Future<void> _onAdd(AddBoardGame event, Emitter<BoardGameState> emit) async {
    try {
      final game = await repo.addBoardGame(event.boardGame);
      emit(BoardGameAddedState(boardGame: game));
    } catch (e) {
      emit(BoardGameErrorState(e.toString()));
    }
  }

  Future<void> _onEdit(
    EditBoardGame event,
    Emitter<BoardGameState> emit,
  ) async {
    try {
      final game = await repo.editBoardGame(event.boardGame);
      emit(BoardGameEditedState(boardGame: game));
    } catch (e) {
      emit(BoardGameErrorState(e.toString()));
    }
  }

  Future<void> _onDelete(
    DeleteBoardGame event,
    Emitter<BoardGameState> emit,
  ) async {
    try {
      final game = await repo.deleteBoardGame(event.boardGame);
      emit(BoardGameDeletedState(boardGame: game));
    } catch (e) {
      emit(BoardGameErrorState(e.toString()));
    }
  }
}
