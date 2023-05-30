import 'package:flutter/material.dart';
import 'package:thrifty/components/default_button.dart';
import 'package:thrifty/models/shipping_address.dart';
import 'order_summery_panel.dart';
import 'payment_method_panel.dart';
import 'shipping_address_card.dart';
import 'shipping_method_panel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final ShippingAddress shippingAddress = demoAddress;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text(
            'Shipping Address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ShippingAddressCard(shippingAddress: shippingAddress),
          const SizedBox(height: 30),
          const PaymentMethodPanel(),
          const SizedBox(height: 30),
          const ShippingMethodPanel(),
          const Spacer(),
          const OrderSummeryPanel(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: DefaultButton(
              text: "Submit Order",
              press: () {},
            ),
          )
        ],
      ),
    );
  }
}
