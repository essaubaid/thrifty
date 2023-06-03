import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thrifty/models/order.dart';

import 'order_id_and_date.dart';
import 'quantity_and_amount.dart';

class Body extends StatelessWidget {
  const Body({
    required this.orders,
    Key? key,
  }) : super(key: key);
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 20.0,
      ),
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
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
                      OrderIdAndDate(
                        orderId: orders[index].id!,
                        date: DateFormat('dd-MMM-yy').format(
                          orders[index].orderTime,
                        ),
                      ),
                      QuantityAndAmount(
                          quantity: orders[index].totalQuantity,
                          amount: orders[index].totalAmount.toStringAsFixed(0)),
                      buildOrderStatus(
                        status: orders[index].status,
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
            ],
          );
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
