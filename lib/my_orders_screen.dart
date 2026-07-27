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
        title: const Text(
          "My Orders",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: orders.isEmpty
          ? const Center(
              child: Text(
                "No Orders Found",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )

          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: orders.length,

              itemBuilder: (context, index) {

                final order = orders[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrderDetailsScreen(order: order),
                      ),
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 16,
                    ),

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(20),

                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,

                          children: [

                            Text(
                              "Order #${order.orderId}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            Chip(
                              label: Text(
                                getOrderStatus(order),
                              ),
                            ),
                          ],
                        ),

                        const Divider(),

                        Row(
                          children: [

                            const Icon(
                              Icons.store,
                              size: 20,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              order.shopName,
                              style:
                                  const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [

                            const Icon(
                              Icons.person,
                              size: 20,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              order.ownerName,
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Text(
                          "Amount: Rs ${order.totalAmount}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [

                            const Icon(
                              Icons.calendar_month,
                              size: 18,
                            ),

                            const SizedBox(width: 6),

                            Text(
             "${order.date.day}-${order.date.month}-${order.date.year}",
                            ),
                          ],
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
