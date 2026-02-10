import 'package:drift/drift.dart';

class BoardGameTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
  IntColumn get minPlayerCount => integer()();
  IntColumn get maxPlayerCount => integer()();
  IntColumn get color => integer()();
}
