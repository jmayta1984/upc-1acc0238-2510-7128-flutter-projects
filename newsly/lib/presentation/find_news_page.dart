import 'package:flutter/material.dart';
import 'package:newsly/data/news_service.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/news_list_view.dart';

class FindNewsPage extends StatefulWidget {
  const FindNewsPage({super.key});

  @override
  State<FindNewsPage> createState() => _FindNewsPageState();
}

class _FindNewsPageState extends State<FindNewsPage> {
  List<News> _newsList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
      child: Column(
        children: [
      
          TextField(
            decoration: InputDecoration(
              hint: Text( 'Search News'),
              border: OutlineInputBorder(),
            ),
            onSubmitted: _onSearchSubmitted,
          ),
          Expanded(child: NewsListView(newsList: _newsList)),
        ],
      ),
    );
  }

  void _onSearchSubmitted(String query) async {

    final newsList = await NewsService().findNews(query);
    setState(() {
      _newsList = newsList;
    });
  }
}