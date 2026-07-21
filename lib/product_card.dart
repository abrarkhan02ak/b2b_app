import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String code;
  final String name;
  final String price;
  final String image;
  final int stock;
  final VoidCallback onAdd;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.code,
    required this.name,
    required this.price,
    required this.image,
    required this.stock,
    required this.onAdd,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Code: $code"),
                    Text(
                      "Wholesale: $price",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("MOQ: 10 pieces"),
if (stock > 20)
  const Text("🟢 In Stock")
else if (stock > 0)
  const Text("🟡 Low Stock")
else
  const Text("🔴 Out of Stock"),
                  ],
                ),
              ),
     ElevatedButton( 
   onPressed: stock > 0 ? onAdd : null,
 child: Text(
  stock > 0 ? "Add" : "Out of Stock",
),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
