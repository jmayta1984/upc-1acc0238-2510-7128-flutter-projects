import 'package:newsly/domain/favorite_news.dart';

class FavoriteNewsDto {
  final String title;
  final String author;
  final String image;
  final String description;

  const FavoriteNewsDto({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });

  factory FavoriteNewsDto.fromDatabase(Map<String, dynamic> map) {
    return FavoriteNewsDto(
      title: map['title'] as String,
      author: map['author'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toDatabase() {
    return {
      'title': title,
      'author': author,
      'image': image,
      'description': description,
    };
  }

  FavoriteNews toDomain() {
    return FavoriteNews(
      title: title,
      author: author,
      image: image,
      description: description,
    );
  }

  factory FavoriteNewsDto.fromDomain(FavoriteNews favoriteNews) {
    return FavoriteNewsDto(
      title: favoriteNews.title,
      author: favoriteNews.author,
      image: favoriteNews.image,
      description: favoriteNews.description,
    );
  }
}
