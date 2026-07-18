import 'package:flutter/material.dart';
import 'cart_model.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty 🛒",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Card(
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(
                      "Code: ${item.code}\nPrice: ₹${item.price}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
