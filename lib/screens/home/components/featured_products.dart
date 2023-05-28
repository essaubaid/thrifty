import 'package:flutter/material.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';
import 'product_card.dart';
import 'section_title.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Featured Products',
          press: () {},
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(product: demoProducts[index]),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
