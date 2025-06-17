import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:demo/features/auth/presentation/blocs/auth_state.dart';
import 'package:demo/features/cart/data/datasources/cart_item_service.dart';
import 'package:demo/features/cart/data/models/cart_item_request_dto.dart';
import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_bloc.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_event.dart';
import 'package:demo/features/favorites/presentation/blocs/favorite_state.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeDetailPage extends StatefulWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  int _selectedIndex = -1;
  bool _isFavorite = false;
  String _username = '';

  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(CheckFavoriteEvent(id: widget.shoe.id));
  }

  @override
  Widget build(BuildContext context) {
    final Shoe shoe = widget.shoe;
    final List<ShoeSize> sizes = shoe.sizes;
    return MultiBlocListener(
      listeners: [
        BlocListener<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            if (state is CheckFavoriteState) {
              setState(() {
                _isFavorite = state.isFavorite;
              });
            }
          },
        ),

        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SuccessAuthState) {
              setState(() {
                _username = state.user.name;
              });
            }
          },
        ),
      ],
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: ColorPalette.primaryColor,
              ),
              onPressed: (_selectedIndex >= 0)
                  ? () {
                      CartItemService().addCartItem(
                        CartItemRequestDto(
                          shoeId: shoe.id,
                          shoeName: shoe.name,
                          username: _username,
                          size: sizes[_selectedIndex].size,
                          quantity: 1,
                          image: shoe.image,
                        ),
                      );
                    }
                  : null,
              child: Text("Add to cart"),
            ),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 300,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Center(
                        child: Hero(
                          tag: widget.shoe.id,
                          child: Image.network(widget.shoe.image),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                            if (_isFavorite) {
                              context.read<FavoriteBloc>().add(
                                AddFavoriteEvent(
                                  favorite: FavoriteShoe(
                                    id: shoe.id.toString(),
                                    name: shoe.name,
                                    price: shoe.price,
                                    image: shoe.image,
                                  ),
                                ),
                              );
                            } else {
                              context.read<FavoriteBloc>().add(
                                RemoveFavoriteEvent(id: shoe.id),
                              );
                            }
                          },
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(widget.shoe.brand),
                Row(
                  children: [
                    Text(
                      widget.shoe.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '\$ ${widget.shoe.price}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(widget.shoe.description),
                Text('Sizes', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      bool isSelected = _selectedIndex == index;
                      ShoeSize size = sizes[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isSelected
                                ? ColorPalette.primaryColor
                                : Colors.white,
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text(
                              size.size,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemCount: sizes.length,
                  ),
                ),
                if (_selectedIndex >= 0)
                  Row(
                    children: [
                      Text("Stock: "),
                      Text(sizes[_selectedIndex].stock.toString()),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
