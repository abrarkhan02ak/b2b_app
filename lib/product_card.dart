import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String code;
  final String name;
  final String price;
  final String image;
final VoidCallback onAdd;

const ProductCard({
  super.key,
  required this.code,
  required this.name,
  required this.price,
  required this.image,
  required this.onAdd,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
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
                    "Wholesale: ₹$price",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    "MOQ: 10 pieces",
                  ),
                ],
              ),
            ),
ElevatedButton(
  onPressed: onAdd,
  child: const Text("Add"),
),
          ],
        ),
      ),
    );
  }
}
