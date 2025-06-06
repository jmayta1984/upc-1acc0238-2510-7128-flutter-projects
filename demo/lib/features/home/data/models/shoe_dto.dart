import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeDto {
  final int id;
  final String name;
  final String brand;
  final String gender;
  final int price;
  final String category;
  final String image;
  final List<ShoeSizeDto> sizes;
  final String description;

  ShoeDto({
    required this.id,
    required this.name,
    required this.brand,
    required this.gender,
    required this.price,
    required this.category,
    required this.image,
    required this.sizes,
    required this.description,
  });

  factory ShoeDto.fromJson(Map<String, dynamic> json) {
    return ShoeDto(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      gender: json['gender'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
      sizes: (json['sizes_available'] as List)
          .map((e) => ShoeSizeDto.fromJson(e))
          .toList(),
      description: json['description'],
    );
  }

  Shoe toDomain() {
    return Shoe(
      id: id,
      name: name,
      brand: brand,
      gender: gender,
      price: price,
      category: category,
      image: image,
      sizes: sizes.map((e) => e.toDomain()).toList(),
      description: description
    );
  }
}

class ShoeSizeDto {
  final double size;
  final int stock;

  ShoeSizeDto({required this.size, required this.stock});

  factory ShoeSizeDto.fromJson(Map<String, dynamic> json) {
    return ShoeSizeDto(
      size: (json['size'] as num).toDouble(),
      stock: json['quantity'],
    );
  }

  ShoeSize toDomain() {
    return ShoeSize(size: size.toString(), stock: stock);
  }
}
