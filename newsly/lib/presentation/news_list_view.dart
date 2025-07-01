import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:newsly/data/news_service.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/news_detail_page.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.query});
  final String query;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late final _pagingController = PagingController<int, News>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => NewsService().findNews(widget.query, pageKey),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PagingListener(
    controller: _pagingController,
    builder: (context, state, fetchNextPage) => PagedListView<int, News>(
      state: state,
      fetchNextPage: fetchNextPage,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, news, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailPage(news: news),
              ),
            ),
            child: NewsListItemView(news: news),
          );
        },
      ),
    ),
  );
}

class NewsListItemView extends StatelessWidget {
  const NewsListItemView({super.key, required this.news});

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
