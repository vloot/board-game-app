class PlayerCount {
  final int min;
  final int max;

  PlayerCount({required this.min, required this.max});

  @override
  String toString() {
    if (min != 0 && max != 0) {
      return '$min-$max';
    }

    return '';
  }
}
