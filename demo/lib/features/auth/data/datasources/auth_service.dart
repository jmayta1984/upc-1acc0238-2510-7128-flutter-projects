import 'dart:convert';
import 'dart:io';

import 'package:demo/features/auth/data/models/user_dto.dart';
import 'package:demo/features/auth/data/models/user_request_dto.dart';
import 'package:demo/features/auth/domain/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<User> login(String username, String password) async {
    final uri = Uri.parse('https://dummyjson.com/user/login');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(UserRequestDto(username: username, password: password).toJson()),
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);
      return UserDto.fromJson(data).toDomain();
    } else {
      throw Exception('Failed to login: (${response.statusCode})');
    }
  }
}
