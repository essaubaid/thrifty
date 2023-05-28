import 'package:flutter/material.dart';
import 'package:thrifty/components/default_button.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class ProductInfoPanel extends StatelessWidget {
  const ProductInfoPanel({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "\$${product.price}",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildCurrentRating(),
            const SizedBox(width: 20),
            product.totalReviews != null
                ? Text(
                    '${product.totalReviews} Reviews',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )
                : Container(),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
          ),
          child: const Divider(),
        ),
        const SizedBox(height: 10),
        Text(
          'Product Description',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
          ),
          child: const Divider(),
        ),
        const SizedBox(height: 10),
        DefaultButton(
          text: "Add To Cart",
          press: () {},
        )
      ],
    );
  }

  Wrap buildCurrentRating() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 14,
        ),
        const SizedBox(width: 1),
        Text(
          product.rating.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
