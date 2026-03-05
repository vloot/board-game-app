import 'package:board_game_app/features/session/domain/session_repository.dart';
import 'package:board_game_app/features/session/presentation/bloc/session_event.dart';
import 'package:board_game_app/features/session/presentation/bloc/session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionFormBloc extends Bloc<SessionFormEvent, SessionFormState> {
  final SessionRepository sessionRepository;

  SessionFormBloc(this.sessionRepository) : super(SessionFormLoading()) {
    on<LoadSessionForm>((event, emit) async {
      emit(SessionFormLoading());
      try {
        final data = await sessionRepository.loadCreationData();

        emit(SessionFormLoaded(players: data.players, boardGames: data.games));
      } catch (e) {
        emit(SessionFormError(e.toString()));
      }
    });
  }
}
