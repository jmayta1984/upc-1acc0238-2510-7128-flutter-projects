import 'package:demo/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Container(
      decoration: BoxDecoration(color: ColorPalette.primaryColor),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SALE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Up to 30%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    foregroundColor: ColorPalette.primaryColor,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            height: 150,
            width: 0.60 * width,
            child: Image.asset("assets/banner.png", fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
