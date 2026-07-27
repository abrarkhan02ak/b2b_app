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

  String selectedPayment = "Cash on Delivery";  

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

const Text(
  "Delivery Details",
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 12),

        Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.grey.shade300,
    ),
  ),

child: Column(
  children: [

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

  ],
),
),
            const SizedBox(height: 20),

 Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: Colors.grey.shade100,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const Text(
        "Order Summary",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 12),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total Items",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "${widget.cartItems.length}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      const SizedBox(height: 10),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total Amount",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Rs ${widget.totalAmount.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

    ],
  ),
),


    const SizedBox(height: 20),

const Text(
  "Payment Method",
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),


const Spacer(),
const SizedBox(height: 10),

Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: Colors.grey.shade300,
    ),
  ),
  child: Column(
    children: [

      ListTile(
        leading: const Icon(Icons.money),
        title: const Text("Cash on Delivery"),
        trailing: selectedPayment == "Cash on Delivery"
            ? const Icon(Icons.check_circle)
            : null,
        onTap: () {
          setState(() {
            selectedPayment = "Cash on Delivery";
          });
        },
      ),

      ListTile(
        leading: const Icon(Icons.phone_android),
        title: const Text("UPI Payment"),
        trailing: selectedPayment == "UPI Payment"
            ? const Icon(Icons.check_circle)
            : null,
        onTap: () {
          setState(() {
            selectedPayment = "UPI Payment";
          });
        },
      ),

      ListTile(
        leading: const Icon(Icons.account_balance),
        title: const Text("Bank Transfer"),
        trailing: selectedPayment == "Bank Transfer"
            ? const Icon(Icons.check_circle)
            : null,
        onTap: () {
          setState(() {
            selectedPayment = "Bank Transfer";
          });
        },
      ),

    ],
  ),
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
  paymentMethod: selectedPayment,
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
