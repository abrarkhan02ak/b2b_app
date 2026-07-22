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
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [

              Stack(
                children: [
      if (discountPercent > 0)
  Positioned(
    top: 5,
    left: 5,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(6),
      ),
    child: Text(
  "$discountPercent% OFF",
  style: const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),
),
    ),
  ),
                  Container(
                    width: 90,
                    height: 90,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        isWishlisted
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: onWishlist,
                    ),
                  ),
                ],
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
  "Pack Size: $packSize",
  style: const TextStyle(
    color: Colors.blueGrey,
    fontSize: 13,
  ),
),

Text(
  "MOQ: $moq",
  style: const TextStyle(
    color: Colors.deepPurple,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  ),
),

                    Text(
                      "Wholesale: INR $price",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "MRP: INR $originalPrice",
                      style: const TextStyle(
              decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Text(
                          "$rating / 5",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

    if (stock > 20)
  const Text(
    "In Stock",
    style: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  )
else if (stock > 0)
  const Text(
    "Low Stock",
    style: TextStyle(
      color: Colors.orange,
      fontWeight: FontWeight.bold,
    ),
  )
else
  const Text(
    "Out of Stock",
    style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),

                  ],
                ),
              ),

       ElevatedButton.icon(
  onPressed: stock > 0 ? onAdd : null,
  icon: const Icon(
    Icons.shopping_cart,
    size: 18,
  ),
  label: Text(
    stock > 0 ? "Add" : "Out",
  ),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
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
