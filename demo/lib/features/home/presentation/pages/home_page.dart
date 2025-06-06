import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/views/banner_view.dart';
import 'package:demo/features/home/presentation/views/shoe_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoe> _shoes = [];
  List<Shoe> _filteredShoes = [];

  Future<void> loadData() async {
    List<Shoe> shoes = await ShoeService().getShoes();
    if (mounted) {
      setState(() {
        _shoes = shoes;
        _filteredShoes = shoes;
      });
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              if (mounted) {
                setState(() {
                  _filteredShoes = _shoes
                      .where(
                        (shoe) => shoe.name.toLowerCase().contains(
                          value.toLowerCase(),
                        ),
                      )
                      .toList();
                });
              }
            },
            cursorColor: ColorPalette.primaryColor,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: "Search",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 2,
                  color: ColorPalette.primaryColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          BannerView(),
          ShoeListView(shoes: _filteredShoes),
        ],
      ),
    );
  }
}
