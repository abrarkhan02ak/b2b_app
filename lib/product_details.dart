import 'package:flutter/material.dart';
import 'models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;
  final VoidCallback onBuyNow;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.onAdd,
    required this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {
    final double saveAmount =
        product.originalPrice - double.parse(product.price);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Hero(
                tag: product.code,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    product.image,
                    height: 260,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  "${product.rating} / 5",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),
            Text(
              "MRP : ₹${product.originalPrice}",
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "Offer Price : ₹${product.price}",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "You Save ₹${saveAmount.toStringAsFixed(0)} (${product.discountPercent}% OFF)",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onAdd,
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Add to Cart"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton.icon(
                      // Buy Now
                      onPressed: onBuyNow,
                    icon: const Icon(Icons.flash_on),
                    label: const Text("Buy Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),
            Text(
              "Pack Size : ${product.packSize}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "MOQ : ${product.moq}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Category : ${product.category}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product.stock > 0
                  ? "✅ In Stock (${product.stock})"
                  : "❌ Out of Stock",
              style: TextStyle(
                color:
                    product.stock > 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

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
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Similar Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: [

                Card(
                  child: Center(
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Card(
                  child: Center(
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
