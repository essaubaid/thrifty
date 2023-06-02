import 'package:flutter/material.dart';

import 'order_id_and_date.dart';
import 'quantity_and_amount.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 20.0,
      ),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const OrderIdAndDate(
                    orderId: '123456789',
                    date: '12/12/2021',
                  ),
                  const QuantityAndAmount(quantity: 2, amount: "300"),
                  buildOrderStatus(
                    status: 'Delivered',
                  ),
                ],
              ));
        },
      ),
    );
  }

  Text buildOrderStatus({required String status}) {
    return Text(
      status,
      style: TextStyle(
        color: status == 'Delivered'
            ? Colors.green
            : status == 'Pending'
                ? Colors.orange
                : Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
