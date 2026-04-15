// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BoardGameTableTable extends BoardGameTable
    with TableInfo<$BoardGameTableTable, BoardGameTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BoardGameTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minPlayerCountMeta = const VerificationMeta(
    'minPlayerCount',
  );
  @override
  late final GeneratedColumn<int> minPlayerCount = GeneratedColumn<int>(
    'min_player_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxPlayerCountMeta = const VerificationMeta(
    'maxPlayerCount',
  );
  @override
  late final GeneratedColumn<int> maxPlayerCount = GeneratedColumn<int>(
    'max_player_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    minPlayerCount,
    maxPlayerCount,
    color,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'board_game_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BoardGameTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('min_player_count')) {
      context.handle(
        _minPlayerCountMeta,
        minPlayerCount.isAcceptableOrUnknown(
          data['min_player_count']!,
          _minPlayerCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minPlayerCountMeta);
    }
    if (data.containsKey('max_player_count')) {
      context.handle(
        _maxPlayerCountMeta,
        maxPlayerCount.isAcceptableOrUnknown(
          data['max_player_count']!,
          _maxPlayerCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_maxPlayerCountMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BoardGameTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BoardGameTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      minPlayerCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}min_player_count'],
      )!,
      maxPlayerCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_player_count'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
    );
  }

  @override
  $BoardGameTableTable createAlias(String alias) {
    return $BoardGameTableTable(attachedDatabase, alias);
  }
}

class BoardGameTableData extends DataClass
    implements Insertable<BoardGameTableData> {
  final int id;
  final String name;
  final int minPlayerCount;
  final int maxPlayerCount;
  final int color;
  final bool isDeleted;
  const BoardGameTableData({
    required this.id,
    required this.name,
    required this.minPlayerCount,
    required this.maxPlayerCount,
    required this.color,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['min_player_count'] = Variable<int>(minPlayerCount);
    map['max_player_count'] = Variable<int>(maxPlayerCount);
    map['color'] = Variable<int>(color);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  BoardGameTableCompanion toCompanion(bool nullToAbsent) {
    return BoardGameTableCompanion(
      id: Value(id),
      name: Value(name),
      minPlayerCount: Value(minPlayerCount),
      maxPlayerCount: Value(maxPlayerCount),
      color: Value(color),
      isDeleted: Value(isDeleted),
    );
  }

  factory BoardGameTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BoardGameTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      minPlayerCount: serializer.fromJson<int>(json['minPlayerCount']),
      maxPlayerCount: serializer.fromJson<int>(json['maxPlayerCount']),
      color: serializer.fromJson<int>(json['color']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'minPlayerCount': serializer.toJson<int>(minPlayerCount),
      'maxPlayerCount': serializer.toJson<int>(maxPlayerCount),
      'color': serializer.toJson<int>(color),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  BoardGameTableData copyWith({
    int? id,
    String? name,
    int? minPlayerCount,
    int? maxPlayerCount,
    int? color,
    bool? isDeleted,
  }) => BoardGameTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    minPlayerCount: minPlayerCount ?? this.minPlayerCount,
    maxPlayerCount: maxPlayerCount ?? this.maxPlayerCount,
    color: color ?? this.color,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  BoardGameTableData copyWithCompanion(BoardGameTableCompanion data) {
    return BoardGameTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      minPlayerCount: data.minPlayerCount.present
          ? data.minPlayerCount.value
          : this.minPlayerCount,
      maxPlayerCount: data.maxPlayerCount.present
          ? data.maxPlayerCount.value
          : this.maxPlayerCount,
      color: data.color.present ? data.color.value : this.color,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardGameTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('minPlayerCount: $minPlayerCount, ')
          ..write('maxPlayerCount: $maxPlayerCount, ')
          ..write('color: $color, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, minPlayerCount, maxPlayerCount, color, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardGameTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.minPlayerCount == this.minPlayerCount &&
          other.maxPlayerCount == this.maxPlayerCount &&
          other.color == this.color &&
          other.isDeleted == this.isDeleted);
}

class BoardGameTableCompanion extends UpdateCompanion<BoardGameTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> minPlayerCount;
  final Value<int> maxPlayerCount;
  final Value<int> color;
  final Value<bool> isDeleted;
  const BoardGameTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.minPlayerCount = const Value.absent(),
    this.maxPlayerCount = const Value.absent(),
    this.color = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  BoardGameTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int minPlayerCount,
    required int maxPlayerCount,
    required int color,
    this.isDeleted = const Value.absent(),
  }) : name = Value(name),
       minPlayerCount = Value(minPlayerCount),
       maxPlayerCount = Value(maxPlayerCount),
       color = Value(color);
  static Insertable<BoardGameTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? minPlayerCount,
    Expression<int>? maxPlayerCount,
    Expression<int>? color,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (minPlayerCount != null) 'min_player_count': minPlayerCount,
      if (maxPlayerCount != null) 'max_player_count': maxPlayerCount,
      if (color != null) 'color': color,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  BoardGameTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? minPlayerCount,
    Value<int>? maxPlayerCount,
    Value<int>? color,
    Value<bool>? isDeleted,
  }) {
    return BoardGameTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      minPlayerCount: minPlayerCount ?? this.minPlayerCount,
      maxPlayerCount: maxPlayerCount ?? this.maxPlayerCount,
      color: color ?? this.color,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (minPlayerCount.present) {
      map['min_player_count'] = Variable<int>(minPlayerCount.value);
    }
    if (maxPlayerCount.present) {
      map['max_player_count'] = Variable<int>(maxPlayerCount.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardGameTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('minPlayerCount: $minPlayerCount, ')
          ..write('maxPlayerCount: $maxPlayerCount, ')
          ..write('color: $color, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $PlayerTableTable extends PlayerTable
    with TableInfo<$PlayerTableTable, PlayerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, color, isDeleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
    );
  }

  @override
  $PlayerTableTable createAlias(String alias) {
    return $PlayerTableTable(attachedDatabase, alias);
  }
}

class PlayerTableData extends DataClass implements Insertable<PlayerTableData> {
  final int id;
  final String name;
  final int color;
  final bool isDeleted;
  const PlayerTableData({
    required this.id,
    required this.name,
    required this.color,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(color);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  PlayerTableCompanion toCompanion(bool nullToAbsent) {
    return PlayerTableCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
      isDeleted: Value(isDeleted),
    );
  }

  factory PlayerTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  PlayerTableData copyWith({
    int? id,
    String? name,
    int? color,
    bool? isDeleted,
  }) => PlayerTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    color: color ?? this.color,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  PlayerTableData copyWithCompanion(PlayerTableCompanion data) {
    return PlayerTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.isDeleted == this.isDeleted);
}

class PlayerTableCompanion extends UpdateCompanion<PlayerTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> color;
  final Value<bool> isDeleted;
  const PlayerTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  PlayerTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int color,
    this.isDeleted = const Value.absent(),
  }) : name = Value(name),
       color = Value(color);
  static Insertable<PlayerTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? color,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  PlayerTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? color,
    Value<bool>? isDeleted,
  }) {
    return PlayerTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $GameSessionTableTable extends GameSessionTable
    with TableInfo<$GameSessionTableTable, GameSessionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameSessionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _playedAtMeta = const VerificationMeta(
    'playedAt',
  );
  @override
  late final GeneratedColumn<DateTime> playedAt = GeneratedColumn<DateTime>(
    'played_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _boardGameIdMeta = const VerificationMeta(
    'boardGameId',
  );
  @override
  late final GeneratedColumn<int> boardGameId = GeneratedColumn<int>(
    'board_game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES board_game_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, playedAt, boardGameId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_session_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameSessionTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('played_at')) {
      context.handle(
        _playedAtMeta,
        playedAt.isAcceptableOrUnknown(data['played_at']!, _playedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_playedAtMeta);
    }
    if (data.containsKey('board_game_id')) {
      context.handle(
        _boardGameIdMeta,
        boardGameId.isAcceptableOrUnknown(
          data['board_game_id']!,
          _boardGameIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_boardGameIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameSessionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameSessionTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}played_at'],
      )!,
      boardGameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}board_game_id'],
      )!,
    );
  }

  @override
  $GameSessionTableTable createAlias(String alias) {
    return $GameSessionTableTable(attachedDatabase, alias);
  }
}

class GameSessionTableData extends DataClass
    implements Insertable<GameSessionTableData> {
  final int id;
  final DateTime playedAt;
  final int boardGameId;
  const GameSessionTableData({
    required this.id,
    required this.playedAt,
    required this.boardGameId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['played_at'] = Variable<DateTime>(playedAt);
    map['board_game_id'] = Variable<int>(boardGameId);
    return map;
  }

  GameSessionTableCompanion toCompanion(bool nullToAbsent) {
    return GameSessionTableCompanion(
      id: Value(id),
      playedAt: Value(playedAt),
      boardGameId: Value(boardGameId),
    );
  }

  factory GameSessionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameSessionTableData(
      id: serializer.fromJson<int>(json['id']),
      playedAt: serializer.fromJson<DateTime>(json['playedAt']),
      boardGameId: serializer.fromJson<int>(json['boardGameId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playedAt': serializer.toJson<DateTime>(playedAt),
      'boardGameId': serializer.toJson<int>(boardGameId),
    };
  }

  GameSessionTableData copyWith({
    int? id,
    DateTime? playedAt,
    int? boardGameId,
  }) => GameSessionTableData(
    id: id ?? this.id,
    playedAt: playedAt ?? this.playedAt,
    boardGameId: boardGameId ?? this.boardGameId,
  );
  GameSessionTableData copyWithCompanion(GameSessionTableCompanion data) {
    return GameSessionTableData(
      id: data.id.present ? data.id.value : this.id,
      playedAt: data.playedAt.present ? data.playedAt.value : this.playedAt,
      boardGameId: data.boardGameId.present
          ? data.boardGameId.value
          : this.boardGameId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameSessionTableData(')
          ..write('id: $id, ')
          ..write('playedAt: $playedAt, ')
          ..write('boardGameId: $boardGameId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playedAt, boardGameId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameSessionTableData &&
          other.id == this.id &&
          other.playedAt == this.playedAt &&
          other.boardGameId == this.boardGameId);
}

class GameSessionTableCompanion extends UpdateCompanion<GameSessionTableData> {
  final Value<int> id;
  final Value<DateTime> playedAt;
  final Value<int> boardGameId;
  const GameSessionTableCompanion({
    this.id = const Value.absent(),
    this.playedAt = const Value.absent(),
    this.boardGameId = const Value.absent(),
  });
  GameSessionTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime playedAt,
    required int boardGameId,
  }) : playedAt = Value(playedAt),
       boardGameId = Value(boardGameId);
  static Insertable<GameSessionTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? playedAt,
    Expression<int>? boardGameId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playedAt != null) 'played_at': playedAt,
      if (boardGameId != null) 'board_game_id': boardGameId,
    });
  }

  GameSessionTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? playedAt,
    Value<int>? boardGameId,
  }) {
    return GameSessionTableCompanion(
      id: id ?? this.id,
      playedAt: playedAt ?? this.playedAt,
      boardGameId: boardGameId ?? this.boardGameId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playedAt.present) {
      map['played_at'] = Variable<DateTime>(playedAt.value);
    }
    if (boardGameId.present) {
      map['board_game_id'] = Variable<int>(boardGameId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameSessionTableCompanion(')
          ..write('id: $id, ')
          ..write('playedAt: $playedAt, ')
          ..write('boardGameId: $boardGameId')
          ..write(')'))
        .toString();
  }
}

class $SessionPlayerTableTable extends SessionPlayerTable
    with TableInfo<$SessionPlayerTableTable, SessionPlayerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionPlayerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES game_session_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<int> playerId = GeneratedColumn<int>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES player_table (id)',
    ),
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isWinnerMeta = const VerificationMeta(
    'isWinner',
  );
  @override
  late final GeneratedColumn<bool> isWinner = GeneratedColumn<bool>(
    'is_winner',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_winner" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    playerId,
    score,
    isWinner,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_player_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionPlayerTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('is_winner')) {
      context.handle(
        _isWinnerMeta,
        isWinner.isAcceptableOrUnknown(data['is_winner']!, _isWinnerMeta),
      );
    } else if (isInserting) {
      context.missing(_isWinnerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {sessionId, playerId},
  ];
  @override
  SessionPlayerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionPlayerTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_id'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      isWinner: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_winner'],
      )!,
    );
  }

  @override
  $SessionPlayerTableTable createAlias(String alias) {
    return $SessionPlayerTableTable(attachedDatabase, alias);
  }
}

class SessionPlayerTableData extends DataClass
    implements Insertable<SessionPlayerTableData> {
  final int id;
  final int sessionId;
  final int playerId;
  final int score;
  final bool isWinner;
  const SessionPlayerTableData({
    required this.id,
    required this.sessionId,
    required this.playerId,
    required this.score,
    required this.isWinner,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_id'] = Variable<int>(sessionId);
    map['player_id'] = Variable<int>(playerId);
    map['score'] = Variable<int>(score);
    map['is_winner'] = Variable<bool>(isWinner);
    return map;
  }

  SessionPlayerTableCompanion toCompanion(bool nullToAbsent) {
    return SessionPlayerTableCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      playerId: Value(playerId),
      score: Value(score),
      isWinner: Value(isWinner),
    );
  }

  factory SessionPlayerTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionPlayerTableData(
      id: serializer.fromJson<int>(json['id']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      playerId: serializer.fromJson<int>(json['playerId']),
      score: serializer.fromJson<int>(json['score']),
      isWinner: serializer.fromJson<bool>(json['isWinner']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionId': serializer.toJson<int>(sessionId),
      'playerId': serializer.toJson<int>(playerId),
      'score': serializer.toJson<int>(score),
      'isWinner': serializer.toJson<bool>(isWinner),
    };
  }

  SessionPlayerTableData copyWith({
    int? id,
    int? sessionId,
    int? playerId,
    int? score,
    bool? isWinner,
  }) => SessionPlayerTableData(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    playerId: playerId ?? this.playerId,
    score: score ?? this.score,
    isWinner: isWinner ?? this.isWinner,
  );
  SessionPlayerTableData copyWithCompanion(SessionPlayerTableCompanion data) {
    return SessionPlayerTableData(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      score: data.score.present ? data.score.value : this.score,
      isWinner: data.isWinner.present ? data.isWinner.value : this.isWinner,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionPlayerTableData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('playerId: $playerId, ')
          ..write('score: $score, ')
          ..write('isWinner: $isWinner')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, playerId, score, isWinner);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionPlayerTableData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.playerId == this.playerId &&
          other.score == this.score &&
          other.isWinner == this.isWinner);
}

class SessionPlayerTableCompanion
    extends UpdateCompanion<SessionPlayerTableData> {
  final Value<int> id;
  final Value<int> sessionId;
  final Value<int> playerId;
  final Value<int> score;
  final Value<bool> isWinner;
  const SessionPlayerTableCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.playerId = const Value.absent(),
    this.score = const Value.absent(),
    this.isWinner = const Value.absent(),
  });
  SessionPlayerTableCompanion.insert({
    this.id = const Value.absent(),
    required int sessionId,
    required int playerId,
    required int score,
    required bool isWinner,
  }) : sessionId = Value(sessionId),
       playerId = Value(playerId),
       score = Value(score),
       isWinner = Value(isWinner);
  static Insertable<SessionPlayerTableData> custom({
    Expression<int>? id,
    Expression<int>? sessionId,
    Expression<int>? playerId,
    Expression<int>? score,
    Expression<bool>? isWinner,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (playerId != null) 'player_id': playerId,
      if (score != null) 'score': score,
      if (isWinner != null) 'is_winner': isWinner,
    });
  }

  SessionPlayerTableCompanion copyWith({
    Value<int>? id,
    Value<int>? sessionId,
    Value<int>? playerId,
    Value<int>? score,
    Value<bool>? isWinner,
  }) {
    return SessionPlayerTableCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      playerId: playerId ?? this.playerId,
      score: score ?? this.score,
      isWinner: isWinner ?? this.isWinner,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<int>(playerId.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (isWinner.present) {
      map['is_winner'] = Variable<bool>(isWinner.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionPlayerTableCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('playerId: $playerId, ')
          ..write('score: $score, ')
          ..write('isWinner: $isWinner')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $BoardGameTableTable boardGameTable = $BoardGameTableTable(this);
  late final $PlayerTableTable playerTable = $PlayerTableTable(this);
  late final $GameSessionTableTable gameSessionTable = $GameSessionTableTable(
    this,
  );
  late final $SessionPlayerTableTable sessionPlayerTable =
      $SessionPlayerTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    boardGameTable,
    playerTable,
    gameSessionTable,
    sessionPlayerTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'game_session_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('session_player_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$BoardGameTableTableCreateCompanionBuilder =
    BoardGameTableCompanion Function({
      Value<int> id,
      required String name,
      required int minPlayerCount,
      required int maxPlayerCount,
      required int color,
      Value<bool> isDeleted,
    });
typedef $$BoardGameTableTableUpdateCompanionBuilder =
    BoardGameTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> minPlayerCount,
      Value<int> maxPlayerCount,
      Value<int> color,
      Value<bool> isDeleted,
    });

final class $$BoardGameTableTableReferences
    extends
        BaseReferences<_$Database, $BoardGameTableTable, BoardGameTableData> {
  $$BoardGameTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$GameSessionTableTable, List<GameSessionTableData>>
  _gameSessionTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.gameSessionTable,
    aliasName: $_aliasNameGenerator(
      db.boardGameTable.id,
      db.gameSessionTable.boardGameId,
    ),
  );

  $$GameSessionTableTableProcessedTableManager get gameSessionTableRefs {
    final manager = $$GameSessionTableTableTableManager(
      $_db,
      $_db.gameSessionTable,
    ).filter((f) => f.boardGameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _gameSessionTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BoardGameTableTableFilterComposer
    extends Composer<_$Database, $BoardGameTableTable> {
  $$BoardGameTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minPlayerCount => $composableBuilder(
    column: $table.minPlayerCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxPlayerCount => $composableBuilder(
    column: $table.maxPlayerCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> gameSessionTableRefs(
    Expression<bool> Function($$GameSessionTableTableFilterComposer f) f,
  ) {
    final $$GameSessionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.boardGameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSessionTableTableFilterComposer(
            $db: $db,
            $table: $db.gameSessionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BoardGameTableTableOrderingComposer
    extends Composer<_$Database, $BoardGameTableTable> {
  $$BoardGameTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minPlayerCount => $composableBuilder(
    column: $table.minPlayerCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxPlayerCount => $composableBuilder(
    column: $table.maxPlayerCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BoardGameTableTableAnnotationComposer
    extends Composer<_$Database, $BoardGameTableTable> {
  $$BoardGameTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get minPlayerCount => $composableBuilder(
    column: $table.minPlayerCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxPlayerCount => $composableBuilder(
    column: $table.maxPlayerCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> gameSessionTableRefs<T extends Object>(
    Expression<T> Function($$GameSessionTableTableAnnotationComposer a) f,
  ) {
    final $$GameSessionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.boardGameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSessionTableTableAnnotationComposer(
            $db: $db,
            $table: $db.gameSessionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BoardGameTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $BoardGameTableTable,
          BoardGameTableData,
          $$BoardGameTableTableFilterComposer,
          $$BoardGameTableTableOrderingComposer,
          $$BoardGameTableTableAnnotationComposer,
          $$BoardGameTableTableCreateCompanionBuilder,
          $$BoardGameTableTableUpdateCompanionBuilder,
          (BoardGameTableData, $$BoardGameTableTableReferences),
          BoardGameTableData,
          PrefetchHooks Function({bool gameSessionTableRefs})
        > {
  $$BoardGameTableTableTableManager(_$Database db, $BoardGameTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BoardGameTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BoardGameTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BoardGameTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> minPlayerCount = const Value.absent(),
                Value<int> maxPlayerCount = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
              }) => BoardGameTableCompanion(
                id: id,
                name: name,
                minPlayerCount: minPlayerCount,
                maxPlayerCount: maxPlayerCount,
                color: color,
                isDeleted: isDeleted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int minPlayerCount,
                required int maxPlayerCount,
                required int color,
                Value<bool> isDeleted = const Value.absent(),
              }) => BoardGameTableCompanion.insert(
                id: id,
                name: name,
                minPlayerCount: minPlayerCount,
                maxPlayerCount: maxPlayerCount,
                color: color,
                isDeleted: isDeleted,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BoardGameTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({gameSessionTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (gameSessionTableRefs) db.gameSessionTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (gameSessionTableRefs)
                    await $_getPrefetchedData<
                      BoardGameTableData,
                      $BoardGameTableTable,
                      GameSessionTableData
                    >(
                      currentTable: table,
                      referencedTable: $$BoardGameTableTableReferences
                          ._gameSessionTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BoardGameTableTableReferences(
                            db,
                            table,
                            p0,
                          ).gameSessionTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.boardGameId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BoardGameTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $BoardGameTableTable,
      BoardGameTableData,
      $$BoardGameTableTableFilterComposer,
      $$BoardGameTableTableOrderingComposer,
      $$BoardGameTableTableAnnotationComposer,
      $$BoardGameTableTableCreateCompanionBuilder,
      $$BoardGameTableTableUpdateCompanionBuilder,
      (BoardGameTableData, $$BoardGameTableTableReferences),
      BoardGameTableData,
      PrefetchHooks Function({bool gameSessionTableRefs})
    >;
typedef $$PlayerTableTableCreateCompanionBuilder =
    PlayerTableCompanion Function({
      Value<int> id,
      required String name,
      required int color,
      Value<bool> isDeleted,
    });
typedef $$PlayerTableTableUpdateCompanionBuilder =
    PlayerTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> color,
      Value<bool> isDeleted,
    });

final class $$PlayerTableTableReferences
    extends BaseReferences<_$Database, $PlayerTableTable, PlayerTableData> {
  $$PlayerTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $SessionPlayerTableTable,
    List<SessionPlayerTableData>
  >
  _sessionPlayerTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.sessionPlayerTable,
    aliasName: $_aliasNameGenerator(
      db.playerTable.id,
      db.sessionPlayerTable.playerId,
    ),
  );

  $$SessionPlayerTableTableProcessedTableManager get sessionPlayerTableRefs {
    final manager = $$SessionPlayerTableTableTableManager(
      $_db,
      $_db.sessionPlayerTable,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _sessionPlayerTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlayerTableTableFilterComposer
    extends Composer<_$Database, $PlayerTableTable> {
  $$PlayerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> sessionPlayerTableRefs(
    Expression<bool> Function($$SessionPlayerTableTableFilterComposer f) f,
  ) {
    final $$SessionPlayerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionPlayerTable,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionPlayerTableTableFilterComposer(
            $db: $db,
            $table: $db.sessionPlayerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlayerTableTableOrderingComposer
    extends Composer<_$Database, $PlayerTableTable> {
  $$PlayerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayerTableTableAnnotationComposer
    extends Composer<_$Database, $PlayerTableTable> {
  $$PlayerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  Expression<T> sessionPlayerTableRefs<T extends Object>(
    Expression<T> Function($$SessionPlayerTableTableAnnotationComposer a) f,
  ) {
    final $$SessionPlayerTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sessionPlayerTable,
          getReferencedColumn: (t) => t.playerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SessionPlayerTableTableAnnotationComposer(
                $db: $db,
                $table: $db.sessionPlayerTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PlayerTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PlayerTableTable,
          PlayerTableData,
          $$PlayerTableTableFilterComposer,
          $$PlayerTableTableOrderingComposer,
          $$PlayerTableTableAnnotationComposer,
          $$PlayerTableTableCreateCompanionBuilder,
          $$PlayerTableTableUpdateCompanionBuilder,
          (PlayerTableData, $$PlayerTableTableReferences),
          PlayerTableData,
          PrefetchHooks Function({bool sessionPlayerTableRefs})
        > {
  $$PlayerTableTableTableManager(_$Database db, $PlayerTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
              }) => PlayerTableCompanion(
                id: id,
                name: name,
                color: color,
                isDeleted: isDeleted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int color,
                Value<bool> isDeleted = const Value.absent(),
              }) => PlayerTableCompanion.insert(
                id: id,
                name: name,
                color: color,
                isDeleted: isDeleted,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayerTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionPlayerTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (sessionPlayerTableRefs) db.sessionPlayerTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (sessionPlayerTableRefs)
                    await $_getPrefetchedData<
                      PlayerTableData,
                      $PlayerTableTable,
                      SessionPlayerTableData
                    >(
                      currentTable: table,
                      referencedTable: $$PlayerTableTableReferences
                          ._sessionPlayerTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PlayerTableTableReferences(
                            db,
                            table,
                            p0,
                          ).sessionPlayerTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.playerId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PlayerTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PlayerTableTable,
      PlayerTableData,
      $$PlayerTableTableFilterComposer,
      $$PlayerTableTableOrderingComposer,
      $$PlayerTableTableAnnotationComposer,
      $$PlayerTableTableCreateCompanionBuilder,
      $$PlayerTableTableUpdateCompanionBuilder,
      (PlayerTableData, $$PlayerTableTableReferences),
      PlayerTableData,
      PrefetchHooks Function({bool sessionPlayerTableRefs})
    >;
typedef $$GameSessionTableTableCreateCompanionBuilder =
    GameSessionTableCompanion Function({
      Value<int> id,
      required DateTime playedAt,
      required int boardGameId,
    });
typedef $$GameSessionTableTableUpdateCompanionBuilder =
    GameSessionTableCompanion Function({
      Value<int> id,
      Value<DateTime> playedAt,
      Value<int> boardGameId,
    });

final class $$GameSessionTableTableReferences
    extends
        BaseReferences<
          _$Database,
          $GameSessionTableTable,
          GameSessionTableData
        > {
  $$GameSessionTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BoardGameTableTable _boardGameIdTable(_$Database db) =>
      db.boardGameTable.createAlias(
        $_aliasNameGenerator(
          db.gameSessionTable.boardGameId,
          db.boardGameTable.id,
        ),
      );

  $$BoardGameTableTableProcessedTableManager get boardGameId {
    final $_column = $_itemColumn<int>('board_game_id')!;

    final manager = $$BoardGameTableTableTableManager(
      $_db,
      $_db.boardGameTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_boardGameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $SessionPlayerTableTable,
    List<SessionPlayerTableData>
  >
  _sessionPlayerTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.sessionPlayerTable,
    aliasName: $_aliasNameGenerator(
      db.gameSessionTable.id,
      db.sessionPlayerTable.sessionId,
    ),
  );

  $$SessionPlayerTableTableProcessedTableManager get sessionPlayerTableRefs {
    final manager = $$SessionPlayerTableTableTableManager(
      $_db,
      $_db.sessionPlayerTable,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _sessionPlayerTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GameSessionTableTableFilterComposer
    extends Composer<_$Database, $GameSessionTableTable> {
  $$GameSessionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get playedAt => $composableBuilder(
    column: $table.playedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BoardGameTableTableFilterComposer get boardGameId {
    final $$BoardGameTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boardGameId,
      referencedTable: $db.boardGameTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BoardGameTableTableFilterComposer(
            $db: $db,
            $table: $db.boardGameTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> sessionPlayerTableRefs(
    Expression<bool> Function($$SessionPlayerTableTableFilterComposer f) f,
  ) {
    final $$SessionPlayerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionPlayerTable,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionPlayerTableTableFilterComposer(
            $db: $db,
            $table: $db.sessionPlayerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GameSessionTableTableOrderingComposer
    extends Composer<_$Database, $GameSessionTableTable> {
  $$GameSessionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get playedAt => $composableBuilder(
    column: $table.playedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BoardGameTableTableOrderingComposer get boardGameId {
    final $$BoardGameTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boardGameId,
      referencedTable: $db.boardGameTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BoardGameTableTableOrderingComposer(
            $db: $db,
            $table: $db.boardGameTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameSessionTableTableAnnotationComposer
    extends Composer<_$Database, $GameSessionTableTable> {
  $$GameSessionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get playedAt =>
      $composableBuilder(column: $table.playedAt, builder: (column) => column);

  $$BoardGameTableTableAnnotationComposer get boardGameId {
    final $$BoardGameTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boardGameId,
      referencedTable: $db.boardGameTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BoardGameTableTableAnnotationComposer(
            $db: $db,
            $table: $db.boardGameTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> sessionPlayerTableRefs<T extends Object>(
    Expression<T> Function($$SessionPlayerTableTableAnnotationComposer a) f,
  ) {
    final $$SessionPlayerTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sessionPlayerTable,
          getReferencedColumn: (t) => t.sessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SessionPlayerTableTableAnnotationComposer(
                $db: $db,
                $table: $db.sessionPlayerTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$GameSessionTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $GameSessionTableTable,
          GameSessionTableData,
          $$GameSessionTableTableFilterComposer,
          $$GameSessionTableTableOrderingComposer,
          $$GameSessionTableTableAnnotationComposer,
          $$GameSessionTableTableCreateCompanionBuilder,
          $$GameSessionTableTableUpdateCompanionBuilder,
          (GameSessionTableData, $$GameSessionTableTableReferences),
          GameSessionTableData,
          PrefetchHooks Function({
            bool boardGameId,
            bool sessionPlayerTableRefs,
          })
        > {
  $$GameSessionTableTableTableManager(
    _$Database db,
    $GameSessionTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameSessionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameSessionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameSessionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> playedAt = const Value.absent(),
                Value<int> boardGameId = const Value.absent(),
              }) => GameSessionTableCompanion(
                id: id,
                playedAt: playedAt,
                boardGameId: boardGameId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime playedAt,
                required int boardGameId,
              }) => GameSessionTableCompanion.insert(
                id: id,
                playedAt: playedAt,
                boardGameId: boardGameId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameSessionTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({boardGameId = false, sessionPlayerTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sessionPlayerTableRefs) db.sessionPlayerTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (boardGameId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.boardGameId,
                                    referencedTable:
                                        $$GameSessionTableTableReferences
                                            ._boardGameIdTable(db),
                                    referencedColumn:
                                        $$GameSessionTableTableReferences
                                            ._boardGameIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sessionPlayerTableRefs)
                        await $_getPrefetchedData<
                          GameSessionTableData,
                          $GameSessionTableTable,
                          SessionPlayerTableData
                        >(
                          currentTable: table,
                          referencedTable: $$GameSessionTableTableReferences
                              ._sessionPlayerTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GameSessionTableTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionPlayerTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GameSessionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $GameSessionTableTable,
      GameSessionTableData,
      $$GameSessionTableTableFilterComposer,
      $$GameSessionTableTableOrderingComposer,
      $$GameSessionTableTableAnnotationComposer,
      $$GameSessionTableTableCreateCompanionBuilder,
      $$GameSessionTableTableUpdateCompanionBuilder,
      (GameSessionTableData, $$GameSessionTableTableReferences),
      GameSessionTableData,
      PrefetchHooks Function({bool boardGameId, bool sessionPlayerTableRefs})
    >;
typedef $$SessionPlayerTableTableCreateCompanionBuilder =
    SessionPlayerTableCompanion Function({
      Value<int> id,
      required int sessionId,
      required int playerId,
      required int score,
      required bool isWinner,
    });
typedef $$SessionPlayerTableTableUpdateCompanionBuilder =
    SessionPlayerTableCompanion Function({
      Value<int> id,
      Value<int> sessionId,
      Value<int> playerId,
      Value<int> score,
      Value<bool> isWinner,
    });

final class $$SessionPlayerTableTableReferences
    extends
        BaseReferences<
          _$Database,
          $SessionPlayerTableTable,
          SessionPlayerTableData
        > {
  $$SessionPlayerTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $GameSessionTableTable _sessionIdTable(_$Database db) =>
      db.gameSessionTable.createAlias(
        $_aliasNameGenerator(
          db.sessionPlayerTable.sessionId,
          db.gameSessionTable.id,
        ),
      );

  $$GameSessionTableTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$GameSessionTableTableTableManager(
      $_db,
      $_db.gameSessionTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayerTableTable _playerIdTable(_$Database db) =>
      db.playerTable.createAlias(
        $_aliasNameGenerator(db.sessionPlayerTable.playerId, db.playerTable.id),
      );

  $$PlayerTableTableProcessedTableManager get playerId {
    final $_column = $_itemColumn<int>('player_id')!;

    final manager = $$PlayerTableTableTableManager(
      $_db,
      $_db.playerTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SessionPlayerTableTableFilterComposer
    extends Composer<_$Database, $SessionPlayerTableTable> {
  $$SessionPlayerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isWinner => $composableBuilder(
    column: $table.isWinner,
    builder: (column) => ColumnFilters(column),
  );

  $$GameSessionTableTableFilterComposer get sessionId {
    final $$GameSessionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSessionTableTableFilterComposer(
            $db: $db,
            $table: $db.gameSessionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayerTableTableFilterComposer get playerId {
    final $$PlayerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.playerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerTableTableFilterComposer(
            $db: $db,
            $table: $db.playerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionPlayerTableTableOrderingComposer
    extends Composer<_$Database, $SessionPlayerTableTable> {
  $$SessionPlayerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isWinner => $composableBuilder(
    column: $table.isWinner,
    builder: (column) => ColumnOrderings(column),
  );

  $$GameSessionTableTableOrderingComposer get sessionId {
    final $$GameSessionTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSessionTableTableOrderingComposer(
            $db: $db,
            $table: $db.gameSessionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayerTableTableOrderingComposer get playerId {
    final $$PlayerTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.playerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerTableTableOrderingComposer(
            $db: $db,
            $table: $db.playerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionPlayerTableTableAnnotationComposer
    extends Composer<_$Database, $SessionPlayerTableTable> {
  $$SessionPlayerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<bool> get isWinner =>
      $composableBuilder(column: $table.isWinner, builder: (column) => column);

  $$GameSessionTableTableAnnotationComposer get sessionId {
    final $$GameSessionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameSessionTableTableAnnotationComposer(
            $db: $db,
            $table: $db.gameSessionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayerTableTableAnnotationComposer get playerId {
    final $$PlayerTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.playerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerTableTableAnnotationComposer(
            $db: $db,
            $table: $db.playerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionPlayerTableTableTableManager
    extends
        RootTableManager<
          _$Database,
          $SessionPlayerTableTable,
          SessionPlayerTableData,
          $$SessionPlayerTableTableFilterComposer,
          $$SessionPlayerTableTableOrderingComposer,
          $$SessionPlayerTableTableAnnotationComposer,
          $$SessionPlayerTableTableCreateCompanionBuilder,
          $$SessionPlayerTableTableUpdateCompanionBuilder,
          (SessionPlayerTableData, $$SessionPlayerTableTableReferences),
          SessionPlayerTableData,
          PrefetchHooks Function({bool sessionId, bool playerId})
        > {
  $$SessionPlayerTableTableTableManager(
    _$Database db,
    $SessionPlayerTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionPlayerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionPlayerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionPlayerTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sessionId = const Value.absent(),
                Value<int> playerId = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<bool> isWinner = const Value.absent(),
              }) => SessionPlayerTableCompanion(
                id: id,
                sessionId: sessionId,
                playerId: playerId,
                score: score,
                isWinner: isWinner,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sessionId,
                required int playerId,
                required int score,
                required bool isWinner,
              }) => SessionPlayerTableCompanion.insert(
                id: id,
                sessionId: sessionId,
                playerId: playerId,
                score: score,
                isWinner: isWinner,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SessionPlayerTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionId = false, playerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionId,
                                referencedTable:
                                    $$SessionPlayerTableTableReferences
                                        ._sessionIdTable(db),
                                referencedColumn:
                                    $$SessionPlayerTableTableReferences
                                        ._sessionIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (playerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playerId,
                                referencedTable:
                                    $$SessionPlayerTableTableReferences
                                        ._playerIdTable(db),
                                referencedColumn:
                                    $$SessionPlayerTableTableReferences
                                        ._playerIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SessionPlayerTableTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $SessionPlayerTableTable,
      SessionPlayerTableData,
      $$SessionPlayerTableTableFilterComposer,
      $$SessionPlayerTableTableOrderingComposer,
      $$SessionPlayerTableTableAnnotationComposer,
      $$SessionPlayerTableTableCreateCompanionBuilder,
      $$SessionPlayerTableTableUpdateCompanionBuilder,
      (SessionPlayerTableData, $$SessionPlayerTableTableReferences),
      SessionPlayerTableData,
      PrefetchHooks Function({bool sessionId, bool playerId})
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$BoardGameTableTableTableManager get boardGameTable =>
      $$BoardGameTableTableTableManager(_db, _db.boardGameTable);
  $$PlayerTableTableTableManager get playerTable =>
      $$PlayerTableTableTableManager(_db, _db.playerTable);
  $$GameSessionTableTableTableManager get gameSessionTable =>
      $$GameSessionTableTableTableManager(_db, _db.gameSessionTable);
  $$SessionPlayerTableTableTableManager get sessionPlayerTable =>
      $$SessionPlayerTableTableTableManager(_db, _db.sessionPlayerTable);
}
