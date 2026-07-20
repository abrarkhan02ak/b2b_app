import 'package:flutter/material.dart';
import 'product_card.dart';
import 'cart_screen.dart';
import 'cart_model.dart';
import 'data/product_data.dart';
import 'models/product.dart';
import 'product_details.dart';
import 'my_orders_screen.dart';
import 'bottom_nav.dart';
import 'category_screen.dart';

void main() {
  runApp(const B2BApp());
}

class B2BApp extends StatelessWidget {
  const B2BApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int currentIndex = 0;

  final List<CartItem> cartItems = [];
  String searchText = "";

  void addToCart(CartItem newItem) {
    setState(() {
      final index = cartItems.indexWhere(
        (item) => item.code == newItem.code,
      );

      if (index >= 0) {
        cartItems[index].quantity++;
      } else {
        cartItems.add(newItem);
      }
      print("Cart size: ${cartItems.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
   final filteredProducts = products.where((product) {
    return product.name.toLowerCase().contains(searchText);
  }).toList();
    return Scaffold(
    appBar: AppBar(
    title: const Text("B2B Wholesale"),
    actions: [
    IconButton(
      icon: const Icon(Icons.receipt_long),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyOrdersScreen(),
          ),
        );
      },
    ),

    IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(
              cartItems: cartItems,
            ),
          ),
        );
      },
    ),
  ],
),     
    
        body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Welcome, Retailer",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
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
            onChanged: (value) {
  setState(() {
    searchText = value.toLowerCase();
  });
},
          ),

          const SizedBox(height: 20),

          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                categoryChip("💄 Cosmetics"),
                categoryChip("🥫 Kirana"),
                categoryChip("📱 Electronics"),
                categoryChip("👕 Clothes"),
                categoryChip("🍪 Snacks"),
              ],
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
   ...filteredProducts.map<Widget>((Product product) {
            return ProductCard(
  code: product.code,
  name: product.name,
  price: product.price,
  image: product.image,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
  product: product,
  onAdd: () {
    addToCart(
      CartItem(
        code: product.code,
        name: product.name,
        price: product.price,
      ),
    );
  },
),
      ),
    );
  },
  onAdd: () {
    addToCart(
      CartItem(
        code: product.code,
        name: product.name,
        price: product.price,
      ),
    );
  },
);
          }).toList(),
        ],
      ),
  bottomNavigationBar: BottomNav(
  currentIndex: currentIndex,
  onTap: (index) {
  if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => CategoryScreen(
  addToCart: addToCart,
),
      ),
    );
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(
          cartItems: cartItems,
        ),
      ),
    );
  } else {
    setState(() {
      currentIndex = index;
    });
  }
},
),
    );
  }

  Widget categoryChip(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(title),
      ),
    );
  }
}
