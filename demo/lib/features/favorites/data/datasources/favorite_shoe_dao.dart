import 'package:demo/features/favorites/data/datasources/app_database.dart';
import 'package:demo/features/favorites/data/models/favorite_shoe_dto.dart';

class FavoriteShoeDao {
  Future<void> insertFavorite(FavoriteShoeDto favoriteShoe) async {
    final db = await AppDatabase().database;
    await db.insert('favorites', favoriteShoe.toMap());
  }

  Future<void> deleteFavorite(int id) async {
    final db = await AppDatabase().database;
    await db.delete('favorites', where: ' id = ?', whereArgs: [id]);
  }

  Future<List<FavoriteShoeDto>> fetchAll() async {
    final db = await AppDatabase().database;
    final maps = await db.query('favorites');
    return maps.map((e) => FavoriteShoeDto.fromMap(e)).toList();
  }

  Future<bool> checkFavorite(int id) async {
    final db = await AppDatabase().database;
    final maps = await db.query('favorites', where: 'id = ?', whereArgs: [id]);
    return maps.isNotEmpty;
  }
}
