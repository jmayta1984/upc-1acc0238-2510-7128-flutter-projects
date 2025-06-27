import 'package:newsly/data/app_database.dart';
import 'package:newsly/data/favorite_news_dto.dart';
import 'package:newsly/domain/favorite_news.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteNewsDao {
  Future<void> addFavoriteNews(FavoriteNews favoriteNews) async {
    Database db = await AppDatabase().database;
    await db.insert(
      "news",
      FavoriteNewsDto.fromDomain(favoriteNews).toDatabase(),
    );
  }

  Future<void> removeFavoriteNews(String title) async {
    Database db = await AppDatabase().database;
    await db.delete("news", where: "title = ?", whereArgs: [title]);
  }

  Future<List<FavoriteNews>> getFavoriteNews() async {
    Database db = await AppDatabase().database;
    final List maps = await db.query("news");

    return maps
        .map((map) => FavoriteNewsDto.fromDatabase(map).toDomain())
        .toList();
  }

  Future<bool> checkIfFavorite(String title) async {
    Database db = await AppDatabase().database;
    final List maps = await db.query(
      "news",
      where: "title = ?",
      whereArgs: [title],
    );

    return maps.isNotEmpty;
  }
}
