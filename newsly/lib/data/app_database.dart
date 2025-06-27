import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  AppDatabase._internal();
  factory AppDatabase() {
    return _instance;
  }

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();

    return _database as Database;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'newsly.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create tables here
        await db.execute('''
          CREATE TABLE news (
            title TEXT primary key,
            author TEXT,
            description TEXT,
            image TEXT
          )
        ''');
      },
    );
  }
}
