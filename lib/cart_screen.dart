import 'package:flutter/material.dart';
import 'cart_model.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int getTotal() {
    int total = 0;

    for (final item in widget.cartItems) {
      final price = item.price.replaceAll(RegExp(r'[^0-9]'), '');
      total += (int.tryParse(price) ?? 0) * item.quantity;
    }

    return total;
  }

  void increaseQuantity(int index) {
    setState(() {
      widget.cartItems[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (widget.cartItems[index].quantity > 1) {
        widget.cartItems[index].quantity--;
      } else {
        widget.cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: widget.cartItems.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];

                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      item.price,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () =>
                                              decreaseQuantity(index),
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                        ),
                                        Text(
                                          '${item.quantity}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              increaseQuantity(index),
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '₹${getItemTotal(item)}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹${getTotal()}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                builder: (context) => CheckoutScreen(
  cartItems: widget.cartItems,
  totalAmount: getTotal().toDouble(),
                                ),
                              ),
                            );
                          },
                          child: const Text("Proceed to Checkout"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  int getItemTotal(CartItem item) {
    final price = item.price.replaceAll(RegExp(r'[^0-9]'), '');
    return (int.tryParse(price) ?? 0) * item.quantity;
  }
}
