import 'package:flutter/material.dart';
import 'package:newsly/presentation/news_list_view.dart';

class FindNewsPage extends StatefulWidget {
  const FindNewsPage({super.key});

  @override
  State<FindNewsPage> createState() => _FindNewsPageState();
}

class _FindNewsPageState extends State<FindNewsPage> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hint: Text('Search News'),
              border: OutlineInputBorder(),
            ),
            onSubmitted: _onSearchSubmitted,
          ),

          Expanded(
            child: _query.isEmpty
                ? Center(child: Text('Please enter a search query'))
                : NewsListView(key:ValueKey(_query), query: _query),
          ),
        ],
      ),
    );
  }

  Future<void> _onSearchSubmitted(String query) async {
    if (mounted) {
      setState(() {
        _query = query;
      });
    }
  }
}
