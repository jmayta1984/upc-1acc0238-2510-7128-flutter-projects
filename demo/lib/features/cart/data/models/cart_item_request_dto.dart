class CartItemRequestDto {
  final int shoeId;
  final String shoeName;
  final String username;
  final String size;
  final int quantity;
  final String image;
  
  const CartItemRequestDto({
    required this.shoeId,
    required this.shoeName,
    required this.username,
    required this.size,
    required this.quantity,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'shoe_id': shoeId,
      'shoe_name': shoeName,
      'username': username,
      'size': size,
      'quantity': quantity,
      'image': image,
    };
  }
}