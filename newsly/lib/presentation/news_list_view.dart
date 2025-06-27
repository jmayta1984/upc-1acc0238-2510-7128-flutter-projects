import 'package:flutter/material.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/news_detail_page.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.newsList});
  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];
        return GestureDetector(
          onTap:() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailPage(news: news),
            ),
          ),
          child: NewsListItemView(news: news));
      },
    );
  }
}

class NewsListItemView extends StatelessWidget {
  const NewsListItemView({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: news.title,
                child: Image.network(
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  news.imageUrl,
                  errorBuilder:
                      (
                        BuildContext context,
                        Object exception,
                        StackTrace? stackTrace,
                      ) {
                        return Center(child: const Text('😢'));
                      },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(news.author),
                Text(news.year),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
