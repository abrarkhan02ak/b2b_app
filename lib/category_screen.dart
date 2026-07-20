import 'package:flutter/material.dart';
import 'category_products_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
  leading: Icon(Icons.shopping_bag),
  title: Text("Cosmetics"),
  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const
     CategoryProductsScreen(
     category: "Cosmetics",
),
    ),
  );
},
),
          ListTile(
            leading: Icon(Icons.cleaning_services),
            title: Text("Personal Care"),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Grocery"),
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text("Other Products"),
          ),
        ],
      ),
    );
  }
}
