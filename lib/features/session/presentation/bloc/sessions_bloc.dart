import 'package:board_game_app/features/session/domain/session_repository.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_event.dart';
import 'package:board_game_app/features/session/presentation/bloc/sessions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  final SessionRepository sessionRepository;

  SessionsBloc(this.sessionRepository) : super(SessionFormLoading()) {
    on<LoadSessions>((event, emit) async {
      emit(SessionsLoading());
      try {
        final sessions = await sessionRepository.getSessions();
        emit(SessionsLoaded(sessions));
      } catch (e) {
        emit(SessionsError(e.toString()));
      }
    });

    on<CreateSession>((event, emit) async {
      emit(SessionFormSubmitted());
      try {
        sessionRepository.createSession(
          boardGameId: event.boardGameId,
          playedAt: event.playedAt,
          players: event.players,
        );
        emit(SessionFormSuccess());
      } catch (e) {
        emit(SessionsError(e.toString()));
      }
    });

    on<DeleteSession>((event, emit) async {
      emit(SessionFormSubmitted());
      try {
        await sessionRepository.deleteSession(event.sessionId);
        emit(SessionDeleted());
      } catch (e) {
        emit(SessionsError(e.toString()));
      }
    });

    on<EditSession>((event, emit) async {
      emit(SessionFormSubmitted());
      try {
        await sessionRepository.updateSession(event.sessionEntity);
        emit(SessionEdited());
      } catch (e) {
        emit(SessionsError(e.toString()));
      }
    });
  }
}
