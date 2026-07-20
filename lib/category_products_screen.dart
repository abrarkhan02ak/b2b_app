import 'package:flutter/material.dart';
import 'data/product_data.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String category;

  const CategoryProductsScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
 final categoryProducts = products
    .where((product) => product.category == category)
    .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
  itemCount: categoryProducts.length,
  itemBuilder: (context, index) {
    final product = categoryProducts[index];

    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.price),
      trailing: Text(product.code),
    );
  },
),
);
}
}
