class PlayerEntity {
  final int id;
  final String name;
  final int color;

  PlayerEntity({this.id = -1, required this.name, required this.color});

  PlayerEntity copyWith({int? id, String? name, int? color}) {
    return PlayerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}
