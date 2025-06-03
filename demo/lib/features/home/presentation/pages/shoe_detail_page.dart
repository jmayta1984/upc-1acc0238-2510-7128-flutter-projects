import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';

class ShoeDetailPage extends StatelessWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(shoe.name),
                background: Hero(
                  tag: shoe.id,
                  child: Image.network(shoe.image),
                ),
              ),
            ),
          ];
        },
        body: Column(children: [Text(shoe.name), Text(shoe.brand)]),
      ),
    );
  }
}
