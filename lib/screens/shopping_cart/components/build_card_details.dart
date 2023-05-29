import 'package:flutter/material.dart';
import '../../../models/cart.dart';
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
              buildTrailingIcon(),
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

  InkWell buildTrailingIcon() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: const Icon(
        Icons.more_vert,
        color: Color(0xFF838589),
        size: 24,
      ),
    );
  }
}
