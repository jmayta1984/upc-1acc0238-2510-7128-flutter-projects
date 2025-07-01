import 'package:flutter/material.dart';
import 'package:foodlab/domain/restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = widget.restaurant;
    final LatLng initialPosition = LatLng(
      restaurant.latitude,
      restaurant.longitude,
    );

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: initialPosition,
              zoom: 14.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            markers: {
              Marker(
                markerId: MarkerId(restaurant.id.toString()),
                position: initialPosition,
                infoWindow: InfoWindow(
                  title: restaurant.title,
                  snippet: restaurant.address,
                ),
              ),
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.35,
            minChildSize: 0.1,
            maxChildSize: 0.35,
            builder: (context, controller) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.title,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,),
                        ),
                        Text(
                          restaurant.description,
                        ),
                        const SizedBox(height: 16.0),
                        Text('Address: ${restaurant.address}'),
                        Text('Phone: ${restaurant.phone}'),
                        Text('Website: ${restaurant.website}'),
                        Text('Rating: ${restaurant.rating.toStringAsFixed(1)}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
