/*
    "id": 1,
    "title": "Osaka",
    "poster": "https://media-cdn.tripadvisor.com/media/photo-s/15/9d/92/de/iluminacion-calida-influencia.jpg",
    "latitude": -12.121945,
    "longitude": -77.0305,
    "address": "Av. El Sol 190, Miraflores 15074, Lima, Perú",
    "phone": "+51 1 2220405",
    "website": "https://osaka.com.pe",
    "rating": 4.7,
    "description": "Osaka Miraflores ofrece una fusión única de cocina japonesa y peruana, conocida como Nikkei. Con un ambiente moderno y sofisticado, es famoso por sus deliciosos makis, sashimis y platos innovadores."
*/

class Restaurant {
  final int id;
  final String title;
  final String poster;
  final double latitude;
  final double longitude;
  final String address;
  final String phone;
  final String website;
  final double rating;
  final String description;

  const Restaurant({
    required this.id,
    required this.title,
    required this.poster,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.phone,
    required this.website,
    required this.rating,
    required this.description,
  });
  
}