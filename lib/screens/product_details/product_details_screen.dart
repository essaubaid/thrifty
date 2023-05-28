import 'package:flutter/material.dart';
import 'package:thrifty/components/custom_app_bar.dart';
import 'package:thrifty/models/product.dart';

import 'components/body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Body(product: product),
          ),
        ),
      ),
    );
  }

  CustomAppBar buildAppBar() {
    return CustomAppBar(
      title: const Text(
        'Product Details',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
