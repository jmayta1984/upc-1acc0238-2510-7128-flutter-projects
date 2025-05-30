import 'package:demo/color_palette.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
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
          Container(
            decoration: BoxDecoration(color: ColorPalette.primaryColor),
            child: Row(
              children: [
                Column(
                  children: [
                    Text("SALE"),
                    Text("Up to 30%"),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        foregroundColor: ColorPalette.primaryColor,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text("Sign in"),
                    ),
                  ],
                ),
                Expanded(child: Image.asset("assets/banner.png")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
