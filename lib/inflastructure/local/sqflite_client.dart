import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'sqflite_client.g.dart';

@Riverpod(keepAlive: true)
SqfliteClient sqfliteClient(SqfliteClientRef ref) {
  return SqfliteClient();
}

class SqfliteClient {
  SqfliteClient();

  Database? _database;

  Database? get database => _database;

  static const _databaseName = 'habits365.db';

  static const counterTable = 'Counter';

  static const appearanceTable = 'Appearance';

  // TODO: FixMe
  Future<void> openDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);
    _database ??= await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // TODO fix appropreate table
        await db.execute(
          '''CREATE TABLE $counterTable (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NULL, content TEXT NULL, is_complete INTEGER, date_modified INTEGER)''',
        );
        await db.execute(
          '''CREATE TABLE $appearanceTable (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NULL, content TEXT NULL, is_complete INTEGER, date_modified INTEGER)''',
        );
      },
    );
  }

  // Future<List<Todo>> getAllTodos() async {
  //   if (_database == null) {
  //     await openDb();
  //   }
  //   List<Map<String, dynamic>> todos = await _database
  //           ?.rawQuery('SELECT * FROM todos ORDER BY date_modified DESC') ??
  //       [];
  //   return todos.map((e) => Todo.fromJson(e)).toList();
  // }

  // Future<Todo?> getTodoById(int id) async {
  //   if (_database == null) {
  //     await openDb();
  //   }
  //   List<Map<String, dynamic>> todos = await _database
  //           ?.rawQuery('SELECT * FROM todos WHERE id = ?', [id.toString()]) ??
  //       [];
  //   return todos.map((e) => Todo.fromJson(e)).toList().firstOrNull;
  // }

  // Future<Todo?> createTodo() async {
  //   if (_database == null) {
  //     await openDb();
  //   }
  //   final id = await _database?.insert('todos', {
  //     'title': '',
  //     'content': '',
  //     'is_complete': 0,
  //     'date_modified': DateTime.now().toUtc().millisecondsSinceEpoch
  //   });
  //   if (id == null) return null;
  //   return await getTodoById(id);
  // }

  // Future<int?> updateTodo(int id, String? title, String? content, bool? isComplete) async {
  //   if (_database == null) {
  //     await openDb();
  //   }
  //   Map<String, dynamic> updatedTodo = {
  //     'title': title,
  //     'content': content,
  //     'is_fav': isComplete == true
  //         ? 1
  //         : isComplete == false
  //             ? 0
  //             : null,
  //     'date_modified': DateTime.now().toUtc().millisecondsSinceEpoch
  //   };
  //   updatedTodo.removeWhere((_, value) => value == null);

  //   return await _database?.update(
  //     'todos',
  //     updatedTodo,
  //     where: "id = ?",
  //     whereArgs: [id.toString()],
  //   );
  // }

  // Future<int?> deleteTodo(int id) async {
  //   if (_database == null) {
  //     await openDb();
  //   }
  //   return await _database
  //       ?.delete('todos', where: "id = ?", whereArgs: [id.toString()]);
  // }
}
