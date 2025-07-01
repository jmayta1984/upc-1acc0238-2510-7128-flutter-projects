import 'dart:convert';
import 'dart:io';

import 'package:foodlab/data/restaurant_dto.dart';
import 'package:foodlab/domain/restaurant.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  final String _baseUrl = 'https://sugary-wool-penguin.glitch.me/restaurants';

  Future<List<Restaurant>> fetchRestaurants() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == HttpStatus.ok) {
        List maps = jsonDecode(response.body);
        return maps.map((map) {
          return RestaurantDto.fromJson(map).toDomain();
        }).toList();
      } else {
        return Future.error(
          'Error fetching restaurants: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return Future.error('Error parsing response: $e');
    }
  }
}
