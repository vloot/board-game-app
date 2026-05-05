class PlayerWinrateEntity {
  final int playerId;
  final int wins;
  final int gamesPlayed;
  final double winrate;

  PlayerWinrateEntity({
    required this.playerId,
    required this.wins,
    required this.gamesPlayed,
    required this.winrate,
  });
}
