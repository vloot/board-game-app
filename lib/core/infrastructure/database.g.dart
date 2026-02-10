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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    minPlayerCount,
    maxPlayerCount,
    color,
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
  const BoardGameTableData({
    required this.id,
    required this.name,
    required this.minPlayerCount,
    required this.maxPlayerCount,
    required this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['min_player_count'] = Variable<int>(minPlayerCount);
    map['max_player_count'] = Variable<int>(maxPlayerCount);
    map['color'] = Variable<int>(color);
    return map;
  }

  BoardGameTableCompanion toCompanion(bool nullToAbsent) {
    return BoardGameTableCompanion(
      id: Value(id),
      name: Value(name),
      minPlayerCount: Value(minPlayerCount),
      maxPlayerCount: Value(maxPlayerCount),
      color: Value(color),
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
    };
  }

  BoardGameTableData copyWith({
    int? id,
    String? name,
    int? minPlayerCount,
    int? maxPlayerCount,
    int? color,
  }) => BoardGameTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    minPlayerCount: minPlayerCount ?? this.minPlayerCount,
    maxPlayerCount: maxPlayerCount ?? this.maxPlayerCount,
    color: color ?? this.color,
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
    );
  }

  @override
  String toString() {
    return (StringBuffer('BoardGameTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('minPlayerCount: $minPlayerCount, ')
          ..write('maxPlayerCount: $maxPlayerCount, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, minPlayerCount, maxPlayerCount, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardGameTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.minPlayerCount == this.minPlayerCount &&
          other.maxPlayerCount == this.maxPlayerCount &&
          other.color == this.color);
}

class BoardGameTableCompanion extends UpdateCompanion<BoardGameTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> minPlayerCount;
  final Value<int> maxPlayerCount;
  final Value<int> color;
  const BoardGameTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.minPlayerCount = const Value.absent(),
    this.maxPlayerCount = const Value.absent(),
    this.color = const Value.absent(),
  });
  BoardGameTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int minPlayerCount,
    required int maxPlayerCount,
    required int color,
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
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (minPlayerCount != null) 'min_player_count': minPlayerCount,
      if (maxPlayerCount != null) 'max_player_count': maxPlayerCount,
      if (color != null) 'color': color,
    });
  }

  BoardGameTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? minPlayerCount,
    Value<int>? maxPlayerCount,
    Value<int>? color,
  }) {
    return BoardGameTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      minPlayerCount: minPlayerCount ?? this.minPlayerCount,
      maxPlayerCount: maxPlayerCount ?? this.maxPlayerCount,
      color: color ?? this.color,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BoardGameTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('minPlayerCount: $minPlayerCount, ')
          ..write('maxPlayerCount: $maxPlayerCount, ')
          ..write('color: $color')
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
  @override
  List<GeneratedColumn> get $columns => [id, name, color];
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
  const PlayerTableData({
    required this.id,
    required this.name,
    required this.color,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(color);
    return map;
  }

  PlayerTableCompanion toCompanion(bool nullToAbsent) {
    return PlayerTableCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
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
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
    };
  }

  PlayerTableData copyWith({int? id, String? name, int? color}) =>
      PlayerTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
  PlayerTableData copyWithCompanion(PlayerTableCompanion data) {
    return PlayerTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color);
}

class PlayerTableCompanion extends UpdateCompanion<PlayerTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> color;
  const PlayerTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  PlayerTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int color,
  }) : name = Value(name),
       color = Value(color);
  static Insertable<PlayerTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  PlayerTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? color,
  }) {
    return PlayerTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
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
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _boardGameIDMeta = const VerificationMeta(
    'boardGameID',
  );
  @override
  late final GeneratedColumn<int> boardGameID = GeneratedColumn<int>(
    'board_game_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES board_game_table (id)',
    ),
  );
  static const VerificationMeta _winnerPlayerIDMeta = const VerificationMeta(
    'winnerPlayerID',
  );
  @override
  late final GeneratedColumn<int> winnerPlayerID = GeneratedColumn<int>(
    'winner_player_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES player_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, time, boardGameID, winnerPlayerID];
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
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('board_game_i_d')) {
      context.handle(
        _boardGameIDMeta,
        boardGameID.isAcceptableOrUnknown(
          data['board_game_i_d']!,
          _boardGameIDMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_boardGameIDMeta);
    }
    if (data.containsKey('winner_player_i_d')) {
      context.handle(
        _winnerPlayerIDMeta,
        winnerPlayerID.isAcceptableOrUnknown(
          data['winner_player_i_d']!,
          _winnerPlayerIDMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_winnerPlayerIDMeta);
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
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}time'],
      )!,
      boardGameID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}board_game_i_d'],
      )!,
      winnerPlayerID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}winner_player_i_d'],
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
  final DateTime time;
  final int boardGameID;
  final int winnerPlayerID;
  const GameSessionTableData({
    required this.id,
    required this.time,
    required this.boardGameID,
    required this.winnerPlayerID,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['time'] = Variable<DateTime>(time);
    map['board_game_i_d'] = Variable<int>(boardGameID);
    map['winner_player_i_d'] = Variable<int>(winnerPlayerID);
    return map;
  }

  GameSessionTableCompanion toCompanion(bool nullToAbsent) {
    return GameSessionTableCompanion(
      id: Value(id),
      time: Value(time),
      boardGameID: Value(boardGameID),
      winnerPlayerID: Value(winnerPlayerID),
    );
  }

  factory GameSessionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameSessionTableData(
      id: serializer.fromJson<int>(json['id']),
      time: serializer.fromJson<DateTime>(json['time']),
      boardGameID: serializer.fromJson<int>(json['boardGameID']),
      winnerPlayerID: serializer.fromJson<int>(json['winnerPlayerID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'time': serializer.toJson<DateTime>(time),
      'boardGameID': serializer.toJson<int>(boardGameID),
      'winnerPlayerID': serializer.toJson<int>(winnerPlayerID),
    };
  }

  GameSessionTableData copyWith({
    int? id,
    DateTime? time,
    int? boardGameID,
    int? winnerPlayerID,
  }) => GameSessionTableData(
    id: id ?? this.id,
    time: time ?? this.time,
    boardGameID: boardGameID ?? this.boardGameID,
    winnerPlayerID: winnerPlayerID ?? this.winnerPlayerID,
  );
  GameSessionTableData copyWithCompanion(GameSessionTableCompanion data) {
    return GameSessionTableData(
      id: data.id.present ? data.id.value : this.id,
      time: data.time.present ? data.time.value : this.time,
      boardGameID: data.boardGameID.present
          ? data.boardGameID.value
          : this.boardGameID,
      winnerPlayerID: data.winnerPlayerID.present
          ? data.winnerPlayerID.value
          : this.winnerPlayerID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameSessionTableData(')
          ..write('id: $id, ')
          ..write('time: $time, ')
          ..write('boardGameID: $boardGameID, ')
          ..write('winnerPlayerID: $winnerPlayerID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, time, boardGameID, winnerPlayerID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameSessionTableData &&
          other.id == this.id &&
          other.time == this.time &&
          other.boardGameID == this.boardGameID &&
          other.winnerPlayerID == this.winnerPlayerID);
}

class GameSessionTableCompanion extends UpdateCompanion<GameSessionTableData> {
  final Value<int> id;
  final Value<DateTime> time;
  final Value<int> boardGameID;
  final Value<int> winnerPlayerID;
  const GameSessionTableCompanion({
    this.id = const Value.absent(),
    this.time = const Value.absent(),
    this.boardGameID = const Value.absent(),
    this.winnerPlayerID = const Value.absent(),
  });
  GameSessionTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime time,
    required int boardGameID,
    required int winnerPlayerID,
  }) : time = Value(time),
       boardGameID = Value(boardGameID),
       winnerPlayerID = Value(winnerPlayerID);
  static Insertable<GameSessionTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? time,
    Expression<int>? boardGameID,
    Expression<int>? winnerPlayerID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (time != null) 'time': time,
      if (boardGameID != null) 'board_game_i_d': boardGameID,
      if (winnerPlayerID != null) 'winner_player_i_d': winnerPlayerID,
    });
  }

  GameSessionTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? time,
    Value<int>? boardGameID,
    Value<int>? winnerPlayerID,
  }) {
    return GameSessionTableCompanion(
      id: id ?? this.id,
      time: time ?? this.time,
      boardGameID: boardGameID ?? this.boardGameID,
      winnerPlayerID: winnerPlayerID ?? this.winnerPlayerID,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (boardGameID.present) {
      map['board_game_i_d'] = Variable<int>(boardGameID.value);
    }
    if (winnerPlayerID.present) {
      map['winner_player_i_d'] = Variable<int>(winnerPlayerID.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameSessionTableCompanion(')
          ..write('id: $id, ')
          ..write('time: $time, ')
          ..write('boardGameID: $boardGameID, ')
          ..write('winnerPlayerID: $winnerPlayerID')
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
  static const VerificationMeta _sessionIDMeta = const VerificationMeta(
    'sessionID',
  );
  @override
  late final GeneratedColumn<int> sessionID = GeneratedColumn<int>(
    'session_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES game_session_table (id)',
    ),
  );
  static const VerificationMeta _playerIDMeta = const VerificationMeta(
    'playerID',
  );
  @override
  late final GeneratedColumn<int> playerID = GeneratedColumn<int>(
    'player_i_d',
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
  @override
  List<GeneratedColumn> get $columns => [id, sessionID, playerID, score];
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
    if (data.containsKey('session_i_d')) {
      context.handle(
        _sessionIDMeta,
        sessionID.isAcceptableOrUnknown(data['session_i_d']!, _sessionIDMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIDMeta);
    }
    if (data.containsKey('player_i_d')) {
      context.handle(
        _playerIDMeta,
        playerID.isAcceptableOrUnknown(data['player_i_d']!, _playerIDMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIDMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionPlayerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionPlayerTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sessionID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_i_d'],
      )!,
      playerID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_i_d'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
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
  final int sessionID;
  final int playerID;
  final int score;
  const SessionPlayerTableData({
    required this.id,
    required this.sessionID,
    required this.playerID,
    required this.score,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['session_i_d'] = Variable<int>(sessionID);
    map['player_i_d'] = Variable<int>(playerID);
    map['score'] = Variable<int>(score);
    return map;
  }

  SessionPlayerTableCompanion toCompanion(bool nullToAbsent) {
    return SessionPlayerTableCompanion(
      id: Value(id),
      sessionID: Value(sessionID),
      playerID: Value(playerID),
      score: Value(score),
    );
  }

  factory SessionPlayerTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionPlayerTableData(
      id: serializer.fromJson<int>(json['id']),
      sessionID: serializer.fromJson<int>(json['sessionID']),
      playerID: serializer.fromJson<int>(json['playerID']),
      score: serializer.fromJson<int>(json['score']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sessionID': serializer.toJson<int>(sessionID),
      'playerID': serializer.toJson<int>(playerID),
      'score': serializer.toJson<int>(score),
    };
  }

  SessionPlayerTableData copyWith({
    int? id,
    int? sessionID,
    int? playerID,
    int? score,
  }) => SessionPlayerTableData(
    id: id ?? this.id,
    sessionID: sessionID ?? this.sessionID,
    playerID: playerID ?? this.playerID,
    score: score ?? this.score,
  );
  SessionPlayerTableData copyWithCompanion(SessionPlayerTableCompanion data) {
    return SessionPlayerTableData(
      id: data.id.present ? data.id.value : this.id,
      sessionID: data.sessionID.present ? data.sessionID.value : this.sessionID,
      playerID: data.playerID.present ? data.playerID.value : this.playerID,
      score: data.score.present ? data.score.value : this.score,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionPlayerTableData(')
          ..write('id: $id, ')
          ..write('sessionID: $sessionID, ')
          ..write('playerID: $playerID, ')
          ..write('score: $score')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionID, playerID, score);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionPlayerTableData &&
          other.id == this.id &&
          other.sessionID == this.sessionID &&
          other.playerID == this.playerID &&
          other.score == this.score);
}

class SessionPlayerTableCompanion
    extends UpdateCompanion<SessionPlayerTableData> {
  final Value<int> id;
  final Value<int> sessionID;
  final Value<int> playerID;
  final Value<int> score;
  const SessionPlayerTableCompanion({
    this.id = const Value.absent(),
    this.sessionID = const Value.absent(),
    this.playerID = const Value.absent(),
    this.score = const Value.absent(),
  });
  SessionPlayerTableCompanion.insert({
    this.id = const Value.absent(),
    required int sessionID,
    required int playerID,
    required int score,
  }) : sessionID = Value(sessionID),
       playerID = Value(playerID),
       score = Value(score);
  static Insertable<SessionPlayerTableData> custom({
    Expression<int>? id,
    Expression<int>? sessionID,
    Expression<int>? playerID,
    Expression<int>? score,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionID != null) 'session_i_d': sessionID,
      if (playerID != null) 'player_i_d': playerID,
      if (score != null) 'score': score,
    });
  }

  SessionPlayerTableCompanion copyWith({
    Value<int>? id,
    Value<int>? sessionID,
    Value<int>? playerID,
    Value<int>? score,
  }) {
    return SessionPlayerTableCompanion(
      id: id ?? this.id,
      sessionID: sessionID ?? this.sessionID,
      playerID: playerID ?? this.playerID,
      score: score ?? this.score,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sessionID.present) {
      map['session_i_d'] = Variable<int>(sessionID.value);
    }
    if (playerID.present) {
      map['player_i_d'] = Variable<int>(playerID.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionPlayerTableCompanion(')
          ..write('id: $id, ')
          ..write('sessionID: $sessionID, ')
          ..write('playerID: $playerID, ')
          ..write('score: $score')
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
}

typedef $$BoardGameTableTableCreateCompanionBuilder =
    BoardGameTableCompanion Function({
      Value<int> id,
      required String name,
      required int minPlayerCount,
      required int maxPlayerCount,
      required int color,
    });
typedef $$BoardGameTableTableUpdateCompanionBuilder =
    BoardGameTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> minPlayerCount,
      Value<int> maxPlayerCount,
      Value<int> color,
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
      db.gameSessionTable.boardGameID,
    ),
  );

  $$GameSessionTableTableProcessedTableManager get gameSessionTableRefs {
    final manager = $$GameSessionTableTableTableManager(
      $_db,
      $_db.gameSessionTable,
    ).filter((f) => f.boardGameID.id.sqlEquals($_itemColumn<int>('id')!));

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

  Expression<bool> gameSessionTableRefs(
    Expression<bool> Function($$GameSessionTableTableFilterComposer f) f,
  ) {
    final $$GameSessionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.boardGameID,
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

  Expression<T> gameSessionTableRefs<T extends Object>(
    Expression<T> Function($$GameSessionTableTableAnnotationComposer a) f,
  ) {
    final $$GameSessionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.boardGameID,
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
              }) => BoardGameTableCompanion(
                id: id,
                name: name,
                minPlayerCount: minPlayerCount,
                maxPlayerCount: maxPlayerCount,
                color: color,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int minPlayerCount,
                required int maxPlayerCount,
                required int color,
              }) => BoardGameTableCompanion.insert(
                id: id,
                name: name,
                minPlayerCount: minPlayerCount,
                maxPlayerCount: maxPlayerCount,
                color: color,
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
                            (e) => e.boardGameID == item.id,
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
    });
typedef $$PlayerTableTableUpdateCompanionBuilder =
    PlayerTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> color,
    });

final class $$PlayerTableTableReferences
    extends BaseReferences<_$Database, $PlayerTableTable, PlayerTableData> {
  $$PlayerTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GameSessionTableTable, List<GameSessionTableData>>
  _gameSessionTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.gameSessionTable,
    aliasName: $_aliasNameGenerator(
      db.playerTable.id,
      db.gameSessionTable.winnerPlayerID,
    ),
  );

  $$GameSessionTableTableProcessedTableManager get gameSessionTableRefs {
    final manager = $$GameSessionTableTableTableManager(
      $_db,
      $_db.gameSessionTable,
    ).filter((f) => f.winnerPlayerID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _gameSessionTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SessionPlayerTableTable,
    List<SessionPlayerTableData>
  >
  _sessionPlayerTableRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.sessionPlayerTable,
    aliasName: $_aliasNameGenerator(
      db.playerTable.id,
      db.sessionPlayerTable.playerID,
    ),
  );

  $$SessionPlayerTableTableProcessedTableManager get sessionPlayerTableRefs {
    final manager = $$SessionPlayerTableTableTableManager(
      $_db,
      $_db.sessionPlayerTable,
    ).filter((f) => f.playerID.id.sqlEquals($_itemColumn<int>('id')!));

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

  Expression<bool> gameSessionTableRefs(
    Expression<bool> Function($$GameSessionTableTableFilterComposer f) f,
  ) {
    final $$GameSessionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.winnerPlayerID,
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

  Expression<bool> sessionPlayerTableRefs(
    Expression<bool> Function($$SessionPlayerTableTableFilterComposer f) f,
  ) {
    final $$SessionPlayerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionPlayerTable,
      getReferencedColumn: (t) => t.playerID,
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

  Expression<T> gameSessionTableRefs<T extends Object>(
    Expression<T> Function($$GameSessionTableTableAnnotationComposer a) f,
  ) {
    final $$GameSessionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameSessionTable,
      getReferencedColumn: (t) => t.winnerPlayerID,
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

  Expression<T> sessionPlayerTableRefs<T extends Object>(
    Expression<T> Function($$SessionPlayerTableTableAnnotationComposer a) f,
  ) {
    final $$SessionPlayerTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sessionPlayerTable,
          getReferencedColumn: (t) => t.playerID,
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
          PrefetchHooks Function({
            bool gameSessionTableRefs,
            bool sessionPlayerTableRefs,
          })
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
              }) => PlayerTableCompanion(id: id, name: name, color: color),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int color,
              }) =>
                  PlayerTableCompanion.insert(id: id, name: name, color: color),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayerTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({gameSessionTableRefs = false, sessionPlayerTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (gameSessionTableRefs) db.gameSessionTable,
                    if (sessionPlayerTableRefs) db.sessionPlayerTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (gameSessionTableRefs)
                        await $_getPrefetchedData<
                          PlayerTableData,
                          $PlayerTableTable,
                          GameSessionTableData
                        >(
                          currentTable: table,
                          referencedTable: $$PlayerTableTableReferences
                              ._gameSessionTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayerTableTableReferences(
                                db,
                                table,
                                p0,
                              ).gameSessionTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.winnerPlayerID == item.id,
                              ),
                          typedResults: items,
                        ),
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
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerID == item.id,
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
      PrefetchHooks Function({
        bool gameSessionTableRefs,
        bool sessionPlayerTableRefs,
      })
    >;
typedef $$GameSessionTableTableCreateCompanionBuilder =
    GameSessionTableCompanion Function({
      Value<int> id,
      required DateTime time,
      required int boardGameID,
      required int winnerPlayerID,
    });
typedef $$GameSessionTableTableUpdateCompanionBuilder =
    GameSessionTableCompanion Function({
      Value<int> id,
      Value<DateTime> time,
      Value<int> boardGameID,
      Value<int> winnerPlayerID,
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

  static $BoardGameTableTable _boardGameIDTable(_$Database db) =>
      db.boardGameTable.createAlias(
        $_aliasNameGenerator(
          db.gameSessionTable.boardGameID,
          db.boardGameTable.id,
        ),
      );

  $$BoardGameTableTableProcessedTableManager get boardGameID {
    final $_column = $_itemColumn<int>('board_game_i_d')!;

    final manager = $$BoardGameTableTableTableManager(
      $_db,
      $_db.boardGameTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_boardGameIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayerTableTable _winnerPlayerIDTable(_$Database db) =>
      db.playerTable.createAlias(
        $_aliasNameGenerator(
          db.gameSessionTable.winnerPlayerID,
          db.playerTable.id,
        ),
      );

  $$PlayerTableTableProcessedTableManager get winnerPlayerID {
    final $_column = $_itemColumn<int>('winner_player_i_d')!;

    final manager = $$PlayerTableTableTableManager(
      $_db,
      $_db.playerTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_winnerPlayerIDTable($_db));
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
      db.sessionPlayerTable.sessionID,
    ),
  );

  $$SessionPlayerTableTableProcessedTableManager get sessionPlayerTableRefs {
    final manager = $$SessionPlayerTableTableTableManager(
      $_db,
      $_db.sessionPlayerTable,
    ).filter((f) => f.sessionID.id.sqlEquals($_itemColumn<int>('id')!));

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

  ColumnFilters<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  $$BoardGameTableTableFilterComposer get boardGameID {
    final $$BoardGameTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boardGameID,
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

  $$PlayerTableTableFilterComposer get winnerPlayerID {
    final $$PlayerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerPlayerID,
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

  Expression<bool> sessionPlayerTableRefs(
    Expression<bool> Function($$SessionPlayerTableTableFilterComposer f) f,
  ) {
    final $$SessionPlayerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessionPlayerTable,
      getReferencedColumn: (t) => t.sessionID,
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

  ColumnOrderings<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  $$BoardGameTableTableOrderingComposer get boardGameID {
    final $$BoardGameTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boardGameID,
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

  $$PlayerTableTableOrderingComposer get winnerPlayerID {
    final $$PlayerTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerPlayerID,
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

  GeneratedColumn<DateTime> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  $$BoardGameTableTableAnnotationComposer get boardGameID {
    final $$BoardGameTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.boardGameID,
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

  $$PlayerTableTableAnnotationComposer get winnerPlayerID {
    final $$PlayerTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerPlayerID,
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

  Expression<T> sessionPlayerTableRefs<T extends Object>(
    Expression<T> Function($$SessionPlayerTableTableAnnotationComposer a) f,
  ) {
    final $$SessionPlayerTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sessionPlayerTable,
          getReferencedColumn: (t) => t.sessionID,
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
            bool boardGameID,
            bool winnerPlayerID,
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
                Value<DateTime> time = const Value.absent(),
                Value<int> boardGameID = const Value.absent(),
                Value<int> winnerPlayerID = const Value.absent(),
              }) => GameSessionTableCompanion(
                id: id,
                time: time,
                boardGameID: boardGameID,
                winnerPlayerID: winnerPlayerID,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime time,
                required int boardGameID,
                required int winnerPlayerID,
              }) => GameSessionTableCompanion.insert(
                id: id,
                time: time,
                boardGameID: boardGameID,
                winnerPlayerID: winnerPlayerID,
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
              ({
                boardGameID = false,
                winnerPlayerID = false,
                sessionPlayerTableRefs = false,
              }) {
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
                        if (boardGameID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.boardGameID,
                                    referencedTable:
                                        $$GameSessionTableTableReferences
                                            ._boardGameIDTable(db),
                                    referencedColumn:
                                        $$GameSessionTableTableReferences
                                            ._boardGameIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (winnerPlayerID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.winnerPlayerID,
                                    referencedTable:
                                        $$GameSessionTableTableReferences
                                            ._winnerPlayerIDTable(db),
                                    referencedColumn:
                                        $$GameSessionTableTableReferences
                                            ._winnerPlayerIDTable(db)
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
                                (e) => e.sessionID == item.id,
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
      PrefetchHooks Function({
        bool boardGameID,
        bool winnerPlayerID,
        bool sessionPlayerTableRefs,
      })
    >;
typedef $$SessionPlayerTableTableCreateCompanionBuilder =
    SessionPlayerTableCompanion Function({
      Value<int> id,
      required int sessionID,
      required int playerID,
      required int score,
    });
typedef $$SessionPlayerTableTableUpdateCompanionBuilder =
    SessionPlayerTableCompanion Function({
      Value<int> id,
      Value<int> sessionID,
      Value<int> playerID,
      Value<int> score,
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

  static $GameSessionTableTable _sessionIDTable(_$Database db) =>
      db.gameSessionTable.createAlias(
        $_aliasNameGenerator(
          db.sessionPlayerTable.sessionID,
          db.gameSessionTable.id,
        ),
      );

  $$GameSessionTableTableProcessedTableManager get sessionID {
    final $_column = $_itemColumn<int>('session_i_d')!;

    final manager = $$GameSessionTableTableTableManager(
      $_db,
      $_db.gameSessionTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayerTableTable _playerIDTable(_$Database db) =>
      db.playerTable.createAlias(
        $_aliasNameGenerator(db.sessionPlayerTable.playerID, db.playerTable.id),
      );

  $$PlayerTableTableProcessedTableManager get playerID {
    final $_column = $_itemColumn<int>('player_i_d')!;

    final manager = $$PlayerTableTableTableManager(
      $_db,
      $_db.playerTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIDTable($_db));
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

  $$GameSessionTableTableFilterComposer get sessionID {
    final $$GameSessionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionID,
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

  $$PlayerTableTableFilterComposer get playerID {
    final $$PlayerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerID,
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

  $$GameSessionTableTableOrderingComposer get sessionID {
    final $$GameSessionTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionID,
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

  $$PlayerTableTableOrderingComposer get playerID {
    final $$PlayerTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerID,
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

  $$GameSessionTableTableAnnotationComposer get sessionID {
    final $$GameSessionTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionID,
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

  $$PlayerTableTableAnnotationComposer get playerID {
    final $$PlayerTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerID,
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
          PrefetchHooks Function({bool sessionID, bool playerID})
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
                Value<int> sessionID = const Value.absent(),
                Value<int> playerID = const Value.absent(),
                Value<int> score = const Value.absent(),
              }) => SessionPlayerTableCompanion(
                id: id,
                sessionID: sessionID,
                playerID: playerID,
                score: score,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sessionID,
                required int playerID,
                required int score,
              }) => SessionPlayerTableCompanion.insert(
                id: id,
                sessionID: sessionID,
                playerID: playerID,
                score: score,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SessionPlayerTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionID = false, playerID = false}) {
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
                    if (sessionID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionID,
                                referencedTable:
                                    $$SessionPlayerTableTableReferences
                                        ._sessionIDTable(db),
                                referencedColumn:
                                    $$SessionPlayerTableTableReferences
                                        ._sessionIDTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (playerID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playerID,
                                referencedTable:
                                    $$SessionPlayerTableTableReferences
                                        ._playerIDTable(db),
                                referencedColumn:
                                    $$SessionPlayerTableTableReferences
                                        ._playerIDTable(db)
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
      PrefetchHooks Function({bool sessionID, bool playerID})
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
