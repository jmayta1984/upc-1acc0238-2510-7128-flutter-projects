import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/widgets/favorite_shoe_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  final List<FavoriteShoe> favorites = [
    FavoriteShoe(
      id: '1',
      name: "Air Jordan 1",
      price: 150,
      image:
          'https://sneakerlogau.com/cdn/shop/products/air-jordan-1-mid-wmns-stealth-1.png',
    ),
    FavoriteShoe(
      id: '1',
      name: "Air Jordan 1",
      price: 150,
      image:
          'https://sneakerlogau.com/cdn/shop/products/air-jordan-1-mid-wmns-stealth-1.png',
    ),
    FavoriteShoe(
      id: '1',
      name: "Air Jordan 1",
      price: 150,
      image:
          'https://sneakerlogau.com/cdn/shop/products/air-jordan-1-mid-wmns-stealth-1.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites"), centerTitle: false),
      body: FavoriteShoeListView(favorites: favorites),
    );
  }
}
