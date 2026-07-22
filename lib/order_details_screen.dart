import 'package:flutter/material.dart';
import 'models/order.dart';
import 'order_status.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [

            Text("Order ID: ${order.orderId}"),
            Text("Shop: ${order.shopName}"),
            Text("Owner: ${order.ownerName}"),
            Text("Mobile: ${order.mobile}"),
            Text("Address: ${order.address}"),
    Text("Status: ${getOrderStatus(order)}"),

            const SizedBox(height: 15),

            const Text(
              "Products",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            ...order.products.map(
              (item) => Card(
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(
     "Qty: ${item.quantity}   Price: Rs. ${item.price}",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "Total: Rs. ${order.totalAmount}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
