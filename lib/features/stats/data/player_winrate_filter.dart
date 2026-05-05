class PlayerWinrateFilter {
  final List<int> playerIds;
  final List<int> boardGameIds;

  const PlayerWinrateFilter({
    this.playerIds = const [],
    this.boardGameIds = const [],
  });

  PlayerWinrateFilter copyWith({
    List<int>? playerIds,
    List<int>? boardGameIds,
  }) {
    return PlayerWinrateFilter(
      playerIds: playerIds ?? this.playerIds,
      boardGameIds: boardGameIds ?? this.boardGameIds,
    );
  }
}
