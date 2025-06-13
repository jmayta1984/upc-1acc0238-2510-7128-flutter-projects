import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_bloc.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("\$ ${favorite.price}"),
                Text(
                  favorite.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
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
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Opciones",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          leading: Icon(Icons.shopping_cart_outlined),
                          title: Text('Add to cart'),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<FavoriteBloc>().add(
                              RemoveFavoriteEvent(id: int.parse(favorite.id)),
                            );
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            leading: Icon(Icons.delete_outlined),
                            title: Text('Remove from favorites'),
                          ),
                        ),
                      ],
                    ),
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
