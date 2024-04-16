import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'sqflite_client.g.dart';

@Riverpod(keepAlive: true)
SqfliteClient sqfliteClient(SqfliteClientRef ref) {
  return SqfliteClient();
}

// No use this client
class SqfliteClient {
  SqfliteClient();

  Database? _database;

  Database? get database => _database;

  static const _databaseName = 'habits365.db';

  static const counterTable = 'Counter';

  static const appearanceTable = 'Appearance';

  Future<void> openDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);
    _database ??= await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $counterTable (id INTEGER PRIMARY KEY, title TEXT NULL, content TEXT NULL, is_complete INTEGER, date_modified INTEGER)''',
        );
        await db.execute(
          '''CREATE TABLE $appearanceTable (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NULL, content TEXT NULL, is_complete INTEGER, date_modified INTEGER)''',
        );
      },
    );
  }
}
