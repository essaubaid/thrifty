import 'package:flutter/material.dart';
import 'package:thrifty/screens/home/components/search_bar.dart';
import 'categories.dart';
import 'popular_products.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: SearchBar(),
        ),
        SizedBox(height: 20),
        Categories(),
        SizedBox(height: 20),
        PopularProducts()
      ],
    );
  }
}
