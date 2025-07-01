import 'dart:convert';
import 'dart:io';

import 'package:newsly/data/news_dto.dart';
import 'package:newsly/domain/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<News>> findNews(String query, int page) async {
    print(page);
    final uri = Uri.parse(
      'https://newsapi.org/v2/everything?q=$query&apiKey=0ded32e65558448784fccdbc73039b0d&page=$page&pageSize=20',
    );
    print(uri);
    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode == HttpStatus.ok) {
        final List maps = jsonDecode(response.body)["articles"];
        return maps.map((json) => NewsDto.fromJson(json).toDomain()).toList();
      } else {
        // Handle the case where the server did not return a 200 OK response
        return Future.error(
          'Error: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
