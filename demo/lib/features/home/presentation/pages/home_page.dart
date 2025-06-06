import 'package:demo/core/theme/color_palette.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:demo/features/home/presentation/widgets/banner_view.dart';
import 'package:demo/features/home/presentation/widgets/shoe_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
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
  */

  @override
  void initState() {
    //loadData();
    context.read<ShoeBloc>().add(GetShoes());
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
                  /*_filteredShoes = _shoes
                      .where(
                        (shoe) => shoe.name.toLowerCase().contains(
                          value.toLowerCase(),
                        ),
                      )
                      .toList();
                      */
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
          Expanded(
            child: BlocBuilder<ShoeBloc, ShoeState>(
              builder: (context, state) {
                if (state is LoadingShoeState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorPalette.primaryColor,
                    ),
                  );
                } else if (state is LoadedShoeState) {
                  return ShoeListView(shoes: state.shoes);
                } else if (state is ErrorShoeState) {
                  return Center(child: Text(state.message));
                } 
                return Center(child: Text("Wellcome"),);
              },
            ),
          ),
          // ShoeListView(shoes: _filteredShoes),
        ],
      ),
    );
  }
}
