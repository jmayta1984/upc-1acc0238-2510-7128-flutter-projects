import 'package:flutter/material.dart';
import 'package:newsly/data/favorite_news_dao.dart';
import 'package:newsly/domain/favorite_news.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<FavoriteNews> _favoriteNewsList = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteNews();
  }

  Future<void> _loadFavoriteNews() async {
    List<FavoriteNews> favoriteNewsList = await FavoriteNewsDao()
        .getFavoriteNews();
    if (mounted) {
      setState(() {
        _favoriteNewsList = favoriteNewsList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _favoriteNewsList.length,
            itemBuilder: (context, index) {
              final favoriteNews = _favoriteNewsList[index];
              return Card(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        favoriteNews.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error, size: 100),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favoriteNews.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(favoriteNews.author),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        FavoriteNewsDao().removeFavoriteNews(
                          favoriteNews.title,
                        );
                        _loadFavoriteNews();
                      },
                    ),  
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
