import 'package:demo/features/auth/domain/user.dart';

class UserDto {
  final int id;
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String image;
  
    const UserDto({
    required this.id,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.image,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'] // Default to empty string if image is null
    );
  }

  User toDomain() {
    return User(
      id: id.toString(),
      email: email,
      name: '$firstName $lastName',
      image: image
    );
  }
}