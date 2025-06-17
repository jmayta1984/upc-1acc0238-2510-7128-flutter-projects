class CartItemDto {
  final int id;
  final int shoeId;
  final String shoeName;
  final String username;
  final String size;
  final int quantity;
  final String image;

  const CartItemDto({
    required this.id,
    required this.shoeId,
    required this.shoeName,
    required this.username,
    required this.size,
    required this.quantity,
    required this.image,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) {
    return CartItemDto(
      id: json['id'] as int,
      shoeId: json['shoe_id'] as int,
      shoeName: json['shoe_name'] as String,
      username: json['username'] as String,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      image: json['image'] as String,
    );
  }
}
