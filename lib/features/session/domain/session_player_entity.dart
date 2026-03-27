class SessionPlayerEntity {
  final int playerId;
  final int? sessionId;
  int score;
  bool isWinner;

  SessionPlayerEntity({
    required this.playerId,
    this.sessionId,
    this.score = 0,
    this.isWinner = false,
  });
}
