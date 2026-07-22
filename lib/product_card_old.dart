import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String code;
  final String name;
  final String price;
  final String image;
  final int stock;
  final double rating;
  final double originalPrice;
  final int discountPercent;
  final String offerText;
  final VoidCallback onAdd;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.code,
    required this.name,
    required this.price,
    required this.image,
    required this.stock,
    required this.rating,
    required this.originalPrice,
    required this.discountPercent,
    required this.offerText,
    required this.onAdd,
    required this.onTap,
    required this.originalPrice,
    required this.discountPercent,
    required this.offerText,
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
    if (discountPercent > 0)
      Text(
        "$discountPercent% OFF - $offerText",
        style: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),

      "Wholesale: $price",Text(
      name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

      "Wholesale: $price",
  style: const TextStyle(
    fontWeight: FontWeight.bold,
  ),
),Text(
      "Rating: $rating / 5.0",
    ),
                    Text("Code: $code"),
 Text(
  "Wholesale: Rs $price",
  style: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.green,
  ),
),

Text(
  "MRP:ÂRs¹$originalPrice",
  style: const TextStyle(
  decoration: TextDecoration.lineThrough,
  color: Colors.grey,
  ),
),
                    const Text("MOQ: 10 pieces"),
if (stock > 20)
  const Text("ðŸŸ¢ In Stock")
else if (stock > 0)
  const Text("ðŸŸ¡ Low Stock")
else
  const Text("ðŸ”´ Out of Stock"),
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
