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
        title: const Text(
          "Order Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          // Order Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  "Order #${order.orderId}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Chip(
                  label: Text(
                    getOrderStatus(order),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Date: ${order.date.day}-${order.date.month}-${order.date.year}",
                ),

              ],
            ),
          ),


          const SizedBox(height: 16),


          // Customer Details
          const Text(
            "Customer Details",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20),

              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                ),
              ],

              color: Colors.white,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  "Shop: ${order.shopName}",
                ),

                Text(
                  "Owner: ${order.ownerName}",
                ),

                Text(
                  "Mobile: ${order.mobile}",
                ),

                Text(
                  "Address: ${order.address}",
                ),

              ],
            ),
          ),


          const SizedBox(height: 20),


          const Text(
            "Products",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),


          const SizedBox(height: 10),


          ...order.products.map(
            (item) => Container(

              margin:
                  const EdgeInsets.only(bottom: 10),

              padding:
                  const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(16),

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Expanded(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    "Qty ${item.quantity}",
                  ),

                  const SizedBox(width: 10),

                  Text(
                    "Rs ${item.price}",
                  ),

                ],
              ),
            ),
          ),


          const SizedBox(height: 20),


          Container(
            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20),

              color: Colors.grey.shade100,
            ),

            child: Text(
              "Total Amount: Rs ${order.totalAmount}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
