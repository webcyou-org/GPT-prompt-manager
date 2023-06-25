import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:prompt_manager/utils/const.dart';
import 'package:prompt_manager/state/prompt_manager_state.dart';

final mainDbProvider =
    Provider<DatabaseHelper>((ref) => DatabaseHelper.instance);

final promptList = FutureProvider<List<PromptState>>((ref) async {
  return ref.watch(mainDbProvider).promptList;
});

// final mainDbApikey = FutureProvider<String>((ref) async {
//   return ref.watch(mainDbProvider).apikey;
// });
// final notesInsertion = FutureProvider.family<Todo, dynamic>((ref, todo) {
//   return ref.watch(mainDbProvider).insert(todo);
// });

class DatabaseHelper {
  static const _databaseName = "prompt_manager.db";
  static const _databaseVersion = 1;
  static const columnId = '_id';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $promptsTableName (
            $columnId INTEGER PRIMARY KEY,
            title TEXT NOT NULL,
            value TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $userTableName (
            $columnId INTEGER PRIMARY KEY,
            apikey TEXT NOT NULL
          )
          ''');
  }

  Future<String> get apikey async {
    Database? db = await instance.database;

    List<Map<String, dynamic>> configTableRow =
        await db!.query(userTableName, limit: 1);
    if (configTableRow.isNotEmpty) return configTableRow.first['apikey'];
    return '';
  }

  Future<List<PromptState>> get promptList async {
    Database? db = await instance.database;

    final List<Map<String, Object?>> queryResult =
        await db!.query(promptsTableName);
    return queryResult.map((e) => PromptState.fromJson(e)).toList();
  }

  Future<int> insert(String tableName, Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    Database? db = await instance.database;
    return await db!.query(tableName);
  }

  Future<List<Map<String, dynamic>>> queryRow(String tableName, int id) async {
    Database? db = await instance.database;
    return await db!.query(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int?> queryRowCount(String tableName) async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<int> update(String tableName, Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(String tableName, int id) async {
    Database? db = await instance.database;
    return await db!.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
