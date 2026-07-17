import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String code;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.code,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Product Code: $code\nWholesale Price: ₹$price",
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text("Add"),
        ),
      ),
    );
  }
}
