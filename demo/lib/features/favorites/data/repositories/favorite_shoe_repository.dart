import 'package:demo/features/favorites/data/datasources/favorite_shoe_dao.dart';
import 'package:demo/features/favorites/data/models/favorite_shoe_dto.dart';
import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';

class FavoriteShoeRepository {
  final FavoriteShoeDao _dao = FavoriteShoeDao();

  Future<void> insertFavorite(FavoriteShoe favorite) async {
    await _dao.insertFavorite(FavoriteShoeDto.fromDomain(favorite));
  }

  Future<void> deleteFavorite(int id) async {
    await _dao.deleteFavorite(id);
  }

  Future<List<FavoriteShoe>> fetchAll() async {
    final dtos = await _dao.fetchAll();
    return dtos.map((e) => e.toDomain()).toList();
  }

  Future<bool> checkFavorite(int id) async {
    return await _dao.checkFavorite(id);
  }
}
