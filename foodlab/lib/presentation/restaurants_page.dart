import 'package:flutter/material.dart';
import 'package:foodlab/data/restaurant_service.dart';
import 'package:foodlab/domain/restaurant.dart';
import 'package:foodlab/presentation/restaurant_detail_page.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  List<Restaurant> _restaurants = [];

  @override
  void initState() {
    super.initState();
    _loadRestaurants();
  }

  Future<void> _loadRestaurants() async {
    final List<Restaurant> restaurants = await RestaurantService()
        .fetchRestaurants();

    setState(() {
      _restaurants = restaurants;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = _restaurants[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    RestaurantDetailPage(restaurant: restaurant),
              ),
            ),
            child: RestaurantListItemView(restaurant: restaurant),
          );
        },
      ),
    );
  }
}

class RestaurantListItemView extends StatelessWidget {
  const RestaurantListItemView({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              restaurant.poster,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            restaurant.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Icon(Icons.star, size: 16),
              const SizedBox(width: 4.0),
              Text(restaurant.rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
