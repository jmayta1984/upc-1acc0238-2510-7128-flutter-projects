import 'package:demo/features/cart/data/datasources/cart_item_service.dart';
import 'package:demo/features/cart/data/models/cart_item_dto.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItemDto> _cartItems = [];

  Future<void> loadData() async {
    final carItems = await CartItemService().getCartItems('emilys');
    setState(() {
      _cartItems = carItems;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping cart')),
      body: _cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return ListTile(
                  leading: Image.network(item.image),
                  title: Text(item.shoeName),
                  subtitle: Text('Size: ${item.size}'),
                  trailing: Text('Quantity: ${item.quantity}'),
                );
              },
            ),
    );
  }
}
