import 'package:flutter/material.dart';

class OrderIdAndDate extends StatelessWidget {
  const OrderIdAndDate({
    required this.orderId,
    required this.date,
    Key? key,
  }) : super(key: key);
  final String orderId;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              const TextSpan(
                text: 'Order ID: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: orderId,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Text(date,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            )),
      ],
    );
  }
}
