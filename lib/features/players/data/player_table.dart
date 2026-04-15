import 'package:drift/drift.dart';

class PlayerTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 32)();
  IntColumn get color => integer()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}
