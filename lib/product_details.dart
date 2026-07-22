import 'package:flutter/material.dart';
import 'models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.image,
                height: 220,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Code: ${product.code}",
              style: const TextStyle(fontSize: 16),
            ),

            Text(
              "Category: ${product.category}",
              style: const TextStyle(fontSize: 16),
            ),

Row(
  children: [
    const Icon(Icons.star, color: Colors.orange, size: 20),
    const SizedBox(width: 6),
    Text(
      "${product.rating} / 5.0",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),  

            Text(
              "Price: ${product.price}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            Text(
              "Stock: ${product.stock}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Description",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),

 const SizedBox(height: 30),

SizedBox(
  width: double.infinity,
  child: ElevatedButton.icon(
  onPressed: () {
  onAdd();
},
    icon: const Icon(Icons.shopping_cart),
    label: const Text("Add to Cart"),
  ),
),

const SizedBox(height: 12),

SizedBox(
  width: double.infinity,
  child: OutlinedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text("Back"),
  ),
),
          ],
        ),
      ),
    );
  }
}
