import 'package:flutter/material.dart';
import 'package:newsly/domain/news.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.news});
  final News news;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              if (mounted) {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              }
            },
            child: Text(
              _isFavorite ? 'Remove' : 'Add',
            ),
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 400,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.news.title,
                child: Image.network(
                  widget.news.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
        ],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.news.source,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                widget.news.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(widget.news.author, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(widget.news.content, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
