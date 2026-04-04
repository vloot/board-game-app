import 'package:board_game_app/features/players/domain/player_entity.dart';
import 'package:board_game_app/features/session/domain/session_player_entity.dart';
import 'package:board_game_app/features/session/presentation/session_form/cubit/session_form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionFormCubit extends Cubit<SessionFormState> {
  SessionFormCubit() : super(SessionFormState([]));

  void addSessionPlayer(SessionPlayerEntity sessionPlayer) {
    var next = state.sessionPlayers;
    next.add(sessionPlayer);
    next.sort((a, b) => b.score.compareTo(a.score));
    emit(SessionFormState(next));
  }

  void removeSessionPlayer(int playerID) {
    var next = state.sessionPlayers;
    next.removeWhere((element) => element.playerId == playerID);
    next.sort((a, b) => b.score.compareTo(a.score));
    emit(SessionFormState(next));
  }

  void updateSessionPlayerPoints(
    SessionPlayerEntity sessionPlayer,
    int points,
  ) {
    var next = state.sessionPlayers;

    try {
      var player = next.singleWhere(
        (element) => element.playerId == sessionPlayer.playerId,
      );
      player.score = points;
    } catch (e) {
      return;
    }

    next.sort((a, b) => b.score.compareTo(a.score));
    emit(SessionFormState(next));
  }

  void updateSessinPlayerWinStatus(int playerID, bool isWinner) {
    var next = state.sessionPlayers;
    try {
      var player = next.singleWhere((element) => element.playerId == playerID);
      player.isWinner = isWinner;
    } catch (e) {
      return;
    }
    emit(SessionFormState(next));
  }

  void updateSessionPlayerPointsByID(String playerID, int points) {
    var next = state.sessionPlayers;
    try {
      var player = next.singleWhere(
        (element) => element.playerId == int.parse(playerID),
      );
      updateSessionPlayerPoints(player, points);
    } catch (e) {
      return;
    }
  }

  bool containsSessionPlayer(PlayerEntity player) {
    return state.sessionPlayers.any((element) => element.playerId == player.id);
  }
}
