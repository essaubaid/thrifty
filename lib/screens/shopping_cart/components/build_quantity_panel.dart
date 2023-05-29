import 'package:flutter/material.dart';
import '../../../models/cart.dart';
import 'build_circular_button.dart';

class BuildQuantityPanel extends StatelessWidget {
  const BuildQuantityPanel({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const BuildCircularButton(
          icon: Icons.add,
        ),
        const SizedBox(width: 10),
        Text(
          item.quantity.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        const BuildCircularButton(
          icon: Icons.remove,
        ),
      ],
    );
  }
}
