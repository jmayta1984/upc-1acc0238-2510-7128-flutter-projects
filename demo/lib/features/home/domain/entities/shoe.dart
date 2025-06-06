class Shoe {
  final int id;
  final String name;
  final String brand;
  final String gender;
  final int price;
  final String category;
  final String image;
  final List<ShoeSize> sizes;
  final String description;

  Shoe({
    required this.id,
    required this.name,
    required this.brand,
    required this.gender,
    required this.price,
    required this.category,
    required this.image,
    required this.sizes,
    required this.description
  });
}

class ShoeSize {
  final String size;
  final int stock;

  ShoeSize({required this.size, required this.stock});
}
