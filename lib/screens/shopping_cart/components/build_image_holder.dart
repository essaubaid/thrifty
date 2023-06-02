import 'package:flutter/material.dart';

import '../../../models/cart.dart';

class BuildImageHolder extends StatelessWidget {
  const BuildImageHolder({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: const Color(0xFFF9F9F9),
        child: Image.network(
          item.product.images[0],
        ),
      ),
    );
  }
}
