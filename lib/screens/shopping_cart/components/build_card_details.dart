import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/cart.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_events.dart';
import 'build_detail_panel.dart';
import 'build_quantity_panel.dart';

class BuildCardDetails extends StatelessWidget {
  const BuildCardDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  item.product.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
              BuildDetailPanel(item: item),
              BuildQuantityPanel(item: item)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildTrailingIcon(
                onTap: () {
                  context.read<CartBloc>().add(RemoveFromCart(cartItem: item));
                },
              ),
              Text(
                '\$${item.totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  InkWell buildTrailingIcon({VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: const Icon(
        Icons.delete_outline,
        color: Color(0xFF838589),
        size: 18,
      ),
    );
  }
}
