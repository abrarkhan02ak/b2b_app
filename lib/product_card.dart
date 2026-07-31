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
      borderRadius: BorderRadius.circular(18),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18),
  side: BorderSide(
    color: Colors.blue.shade100,
    width: 1,
  ),
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
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      image,
                      height: 120,
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
                    top: 2,
                    right: 2,
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
    Positioned(
  left: 8,
  bottom: 8,
  child: Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 6,
      vertical: 2,
    ),
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 14,
        ),
        const SizedBox(width: 3),
        Text(
          "$rating",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),


                ],
              ),

              const SizedBox(height: 10),
  


         Text(
  name,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  style: const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    height: 1.3,
  ),
),

const SizedBox(height: 4),

Text(
  "Weight - $packSize",
  style: const TextStyle(
    color: Colors.grey,
    fontSize: 12,
  ),
),

const SizedBox(height: 8),

Text(
  "MRP ₹$originalPrice   ❌   For You",
  style: const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 4),

Text(
  "Buy at ₹$price",
  style: const TextStyle(
    color: Colors.green,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  ),
),

const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
