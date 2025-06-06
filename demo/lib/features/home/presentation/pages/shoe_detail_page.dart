import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:flutter/material.dart';

class ShoeDetailPage extends StatefulWidget {
  const ShoeDetailPage({super.key, required this.shoe});
  final Shoe shoe;

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  int _selectedIndex = -1;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final List<ShoeSize> sizes = widget.shoe.sizes;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: ColorPalette.primaryColor,
          ),
          onPressed: (_selectedIndex >= 0) ? () {} : null,
          child: Text("Add to cart"),
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
                        },
                        icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Column(
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
    );
  }
}
