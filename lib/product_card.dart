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
  final String packSize;
  final String moq;
  final VoidCallback onAdd;
  final VoidCallback onTap;
  final VoidCallback onWishlist;
  final bool isWishlisted;

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
    required this.packSize,
    required this.moq,
    required this.onAdd,
    required this.onTap,
    required this.onWishlist,
    required this.isWishlisted,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  if (discountPercent > 0)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "$discountPercent% OFF",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: onWishlist,
                      icon: Icon(
                        isWishlisted
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),
              Text(
                "MRP: ₹$originalPrice",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "Offer Price: ₹$price",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                offerText,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "$rating",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                "Pack Size : $packSize",
                style: const TextStyle(
                  color: Colors.blueGrey,
                ),
              ),

              Text(
                "MOQ : $moq",
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                stock > 0 ? "🟢 In Stock" : "🔴 Out of Stock",
                style: TextStyle(
                  color: stock > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: stock > 0 ? onTap : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
