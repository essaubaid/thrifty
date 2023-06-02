import 'package:flutter/material.dart';
import 'package:thrifty/size_config.dart';
import '../../../models/product.dart';
import 'build_image_carousel.dart';
import 'product_info_panel.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.product,
    required this.selectedColor,
    required this.selectedSize,
  });
  final Product product;
  final String selectedColor;
  final String selectedSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildImageCarousel(product: product),
          const SizedBox(height: 40),
          ProductInfoPanel(
            product: product,
            selectedColor: selectedColor,
            selectedSize: selectedSize,
          )
        ],
      ),
    );
  }
}
