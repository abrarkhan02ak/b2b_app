import 'package:flutter/material.dart';
import 'product_card.dart';
import 'cart_screen.dart';

void main() {
  runApp(const B2BApp());
}

class B2BApp extends StatelessWidget {
  const B2BApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: const Text("B2B Wholesale"),
  actions: [
    IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        );
      },
    ),
  ],
),
          body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Welcome, Retailer 👋",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryChip("💄 Cosmetics"),
                  categoryChip("🥫 Kirana"),
                  categoryChip("📱 Electronics"),
                  categoryChip("👕 Clothes"),
                  categoryChip("🍪 Snacks"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Featured Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            ProductCard(
              code: "P001",
              name: "Face Cream",
              price: "120",
            ),

            ProductCard(
              code: "P002",
              name: "Shampoo",
              price: "80",
            ),

            ProductCard(
              code: "P003",
              name: "Cosmetic Kit",
              price: "250",
            ),
          ],
        ),
      ),
    );
  }  Widget categoryChip(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(title),
      ),
    );
  }
}
