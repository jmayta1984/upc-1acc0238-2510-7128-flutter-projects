import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';

class FavoriteShoeDto {
  final int id;
  final String name;
  final String image;
  final int price;

  const FavoriteShoeDto({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  // Converts a FavoriteShoeDto to a map for database storage
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'image': image, 'price': price};
  }

  // Converts a map to a FavoriteShoeDto
  factory FavoriteShoeDto.fromMap(Map<String, dynamic> map) {
    return FavoriteShoeDto(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
    );
  }

  // Converts a FavoriteShoeDto to a FavoriteShoe entity
  FavoriteShoe toDomain() {
    return FavoriteShoe(
      id: id.toString(),
      name: name,
      image: image,
      price: price,
    );
  }

  // Converts a FavoriteShoe entity to a FavoriteShoeDto
  factory FavoriteShoeDto.fromDomain(FavoriteShoe favoriteShoe) {
    return FavoriteShoeDto(
      id: int.parse(favoriteShoe.id),
      name: favoriteShoe.name,
      image: favoriteShoe.image,
      price: favoriteShoe.price,
    );
  }
}
