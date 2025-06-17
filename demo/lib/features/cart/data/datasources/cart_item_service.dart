import 'dart:convert';
import 'dart:io';

import 'package:demo/features/cart/data/models/cart_item_dto.dart';
import 'package:demo/features/cart/data/models/cart_item_request_dto.dart';
import 'package:http/http.dart' as http;

class CartItemService {
  Future<CartItemDto> addCartItem(CartItemRequestDto request) async {
    final uri = Uri.parse('https://sugary-wool-penguin.glitch.me/orders');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == HttpStatus.created) {
      final data = jsonDecode(response.body);
      return CartItemDto.fromJson(data);
    } else {
      throw Exception('Failed to add cart item: (${response.statusCode})');
    }
  }

  Future<List<CartItemDto>> getCartItems(String username) async {
    final uri = Uri.parse('https://sugary-wool-penguin.glitch.me/orders?username=$username');
    final response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      List maps = jsonDecode(response.body);
      return maps.map((e) => CartItemDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch cart items: (${response.statusCode})');
    }
  }
}
