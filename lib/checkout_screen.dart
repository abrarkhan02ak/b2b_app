import 'package:flutter/material.dart';
import 'cart_model.dart';

class CheckoutScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final double totalAmount;
  final TextEditingController shopController =
    TextEditingController();

final TextEditingController ownerController =
    TextEditingController();

final TextEditingController mobileController =
    TextEditingController();

final TextEditingController addressController =
    TextEditingController();

    CheckoutScreen({
    super.key,
    required this.cartItems,
    required this.totalAmount,
  });

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

   Text("Total Items: ${cartItems.length}"),    
      Text(
  "Total Amount: ₹${totalAmount.toStringAsFixed(2)}",
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Order Placed Successfully!"),
                    ),
                  );
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
