import 'package:flutter/material.dart';

class ShippingMethodPanel extends StatelessWidget {
  const ShippingMethodPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shipping Method',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildShippingProvider(
              provider: 'assets/images/fedex-express.png',
              duration: '2-3 days',
            ),
            buildShippingProvider(
              provider: 'assets/images/fedex-express.png',
              duration: '2-3 days',
            ),
            buildShippingProvider(
              provider: 'assets/images/fedex-express.png',
              duration: '2-3 days',
            ),
          ],
        ),
      ],
    );
  }

  Container buildShippingProvider({String? provider, String? duration}) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(provider ?? 'assets/images/fedex-express.png'),
          const SizedBox(height: 5),
          Text(
            duration ?? '2-3 days',
            style: const TextStyle(
              fontSize: 8,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
