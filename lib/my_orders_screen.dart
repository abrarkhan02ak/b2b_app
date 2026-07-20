import 'package:flutter/material.dart';
import 'order_data.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),

      body: orders.isEmpty
          ? const Center(
              child: Text("No Orders Found"),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      "Order ID: ${order.orderId}",
                    ),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shop: ${order.shopName}",
                        ),
                        Text(
                          "Owner: ${order.ownerName}",
                        ),
                        Text(
                          "Amount: ₹${order.totalAmount}",
                        ),
                        Text(
                          "Status: ${order.status}",
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
