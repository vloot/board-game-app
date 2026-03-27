import 'package:board_game_app/features/session/domain/session_entity.dart';

abstract class SessionsState {}

class SessionsLoading extends SessionsState {}

class SessionsLoaded extends SessionsState {
  final List<SessionEntity> sessions;

  SessionsLoaded(this.sessions);
}

class SessionFormLoading extends SessionsState {}

class SessionFormSubmitted extends SessionsState {}

class SessionFormSuccess extends SessionsState {}

class SessionsError extends SessionsState {
  final String message;

  SessionsError(this.message);
}
