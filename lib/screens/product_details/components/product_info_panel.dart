import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifty/components/default_button.dart';
import 'package:thrifty/models/cart.dart';
import 'package:thrifty/screens/shopping_cart/bloc/cart_bloc.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';
import '../../shopping_cart/bloc/cart_events.dart';
import '../bloc/product_details_bloc.dart';
import '../bloc/product_details_event.dart';
import 'color_picker.dart';
import 'size_picker.dart';

class ProductInfoPanel extends StatelessWidget {
  const ProductInfoPanel({
    Key? key,
    required this.product,
    required this.selectedColor,
    required this.selectedSize,
  }) : super(key: key);

  final Product product;
  final String selectedColor;
  final String selectedSize;

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
        ColorPicker(
          availableColors: product.colors,
          selectedColor: selectedColor,
          onColorSelected: (color) {
            context.read<ProductDetailsBloc>().add(ColorChanged(color));
          },
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
          ),
          child: const Divider(),
        ),
        const SizedBox(height: 10),
        SizePicker(
          availableSizes: product.sizes,
          selectedSize: selectedSize,
          onSizeSelected: (size) {
            context.read<ProductDetailsBloc>().add(SizeChanged(size));
          },
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),
          ),
          child: const Divider(),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
          ),
          child: DefaultButton(
            text: "Add To Cart",
            press: () {
              context.read<CartBloc>().add(AddToCart(
                      cartItem: CartItem(
                    product: product,
                    quantity: 1,
                    color: selectedColor,
                    size: selectedSize,
                  )));
            },
          ),
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
