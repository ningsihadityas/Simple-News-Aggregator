import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qlipper/collection/collection_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DBHelper {
  static const _databaseName = 'CollectionData.db';
  static const _databaseVersion = 1;

  DBHelper._();
  static final DBHelper instance = DBHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${Collection.tblCollection}(
      ${Collection.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Collection.colName} TEXT NOT NULL
    )
    ''');
  }

  Future<int> insertCollection(Collection collection) async {
    Database db = await database;
    return await db.insert(Collection.tblCollection, collection.toMap());
  }

  Future<int> updateCollection(Collection collection) async {
    Database db = await database;
    return await db.update(Collection.tblCollection, collection.toMap(),
        where: '${Collection.colId}=?', whereArgs: [collection.id]);
  }

  Future<int> deleteCollection(int id) async {
    Database db = await database;
    return await db.delete(Collection.tblCollection,
        where: '${Collection.colId}=?', whereArgs: [id]);
  }

  Future<List<Collection>> fetchCollections() async {
    Database db = await database;
    List<Map> collections = await db.query(Collection.tblCollection);

    return collections.length == 0
        ? []
        : collections.map((e) => Collection.fromMap(e)).toList();
  }
}
