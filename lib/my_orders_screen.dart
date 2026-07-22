import 'package:flutter/material.dart';
import 'order_data.dart';
import 'order_details_screen.dart';
import 'order_status.dart';

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
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
   builder: (context) => OrderDetailsScreen(order: order),
    ),
  );
},
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
             "Amount: Rs. ${order.totalAmount}",
                        ),

                        Text(
           "Status: ${getOrderStatus(order)}",
                        ),

                        Text(
 "Date: ${order.date.day}-${order.date.month}-${order.date.year}",
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
