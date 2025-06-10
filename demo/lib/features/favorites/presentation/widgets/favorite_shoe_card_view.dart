import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:flutter/material.dart';

class FavoriteShoeCardView extends StatelessWidget {
  const FavoriteShoeCardView({super.key, required this.favorite});

  final FavoriteShoe favorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 160,
            height: 120,
            child: Image.network(favorite.image),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$ ${favorite.price}"),
              Text(
                favorite.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: ColorPalette.primaryColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    builder: (context) => SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sizes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Text("Add to cart"),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
                builder: (context) => SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Opciones",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: () {}, child: Text("Add to cart")),
                      TextButton(
                        onPressed: () {},
                        child: Text("Remove from favorites"),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
