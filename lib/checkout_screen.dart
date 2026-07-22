import 'package:flutter/material.dart';
import 'cart_model.dart';
import 'models/order.dart';
import 'order_data.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final double totalAmount;

  CheckoutScreen({
    super.key,
    required this.cartItems,
    required this.totalAmount,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  final TextEditingController shopController =
      TextEditingController();

  final TextEditingController ownerController =
      TextEditingController();

  final TextEditingController mobileController =
      TextEditingController();

  final TextEditingController addressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Order Summary",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: shopController,
              decoration: const InputDecoration(
                labelText: "Shop Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: ownerController,
              decoration: const InputDecoration(
                labelText: "Owner Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Mobile Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

 Text("Total Items: ${widget.cartItems.length}"),

  Text(
  "Total Amount: ₹${widget.totalAmount.toStringAsFixed(2)}",
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
if (shopController.text.trim().isEmpty ||
    ownerController.text.trim().isEmpty ||
    mobileController.text.trim().isEmpty ||
    addressController.text.trim().isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Please fill all details"),
    ),
  );
  return;
}
            final order = Order(
  orderId: DateTime.now().
millisecondsSinceEpoch.toString(),
  products: widget.cartItems,
  totalAmount: widget.totalAmount,
  status: "Pending",
  shopName: shopController.text,
  ownerName: ownerController.text,
  mobile: mobileController.text,
  address: addressController.text,
  date: DateTime.now(),
);
 orders.add(order);
await saveOrders();
widget.cartItems.clear();

 ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Order Placed Successfully!",
                      ),
                    ),
                  );
Navigator.pop(context);
                },
                child: const Text("Place Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
