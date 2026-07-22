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
import 'profile_screen.dart';
import 'order_data.dart';
import 'wishlist_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadOrders();

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
final List<WishlistItem> wishlistItems = [];

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

void toggleWishlist(WishlistItem item) {
  setState(() {
    final index = wishlistItems.indexWhere(
      (wishlistItem) => wishlistItem.code == item.code,
    );

    if (index >= 0) {
      wishlistItems.removeAt(index);
    } else {
      wishlistItems.add(item);
    }
  });
}

  @override
  Widget build(BuildContext context) {
   final filteredProducts = products.where((product) {
 return product.name.toLowerCase().contains(searchText) ||
    product.code.toLowerCase().contains(searchText) ||
    product.category.toLowerCase().contains(searchText);
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
suffixIcon: searchText.isNotEmpty
    ? IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          setState(() {
            searchText = "";
          });
        },
      )
    : null,             
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

if (filteredProducts.isEmpty)
  const Center(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "No Products Found",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
       
   ...filteredProducts.map<Widget>((Product product) {
            return ProductCard(
  code: product.code,
  name: product.name,
  price: product.price,
  image: product.image,
  stock: product.stock,
  rating: product.rating,
  originalPrice: product.originalPrice,
 discountPercent: product.discountPercent,
offerText: product.offerText,
packSize: product.packSize,
moq: product.moq,
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
onWishlist: () {
  toggleWishlist(
    WishlistItem(
      code: product.code,
      name: product.name,
      price: product.price,
      image: product.image,
    ),
  );
},

isWishlisted: wishlistItems.any(
  (item) => item.code == product.code,
),
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
          wishlistItems: wishlistItems,
          toggleWishlist: toggleWishlist,
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
  } else if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WishlistScreen(
          wishlistItems: wishlistItems,
          toggleWishlist: toggleWishlist,
        ),
      ),
    );
  } else if (index == 4) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyOrdersScreen(),
      ),
    );
  } else if (index == 5) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
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
