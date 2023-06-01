import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/cart.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_events.dart';
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
        BuildCircularButton(
          icon: Icons.add,
          onTap: () {
            context.read<CartBloc>().add(
                  AddToCart(cartItem: item),
                );
          },
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
        BuildCircularButton(
          icon: Icons.remove,
          onTap: () {
            context.read<CartBloc>().add(
                  DecreaseCartItemQuantity(cartItem: item),
                );
          },
        ),
      ],
    );
  }
}
