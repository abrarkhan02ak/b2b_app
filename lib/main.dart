import 'product_card.dart';
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

      const SizedBox(height: 8),

      const Text(
        "Find the best wholesale products",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
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
        "Featured Products",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 10),

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