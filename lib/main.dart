import 'package:flutter/material.dart';
import 'product_card.dart';
import 'cart_screen.dart';
import 'checkout_screen.dart';
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
  List<Widget> get pages => [
    const SizedBox(),

    CategoryScreen(
      addToCart: addToCart,
      wishlistItems: wishlistItems,
      toggleWishlist: toggleWishlist,
    ),

    CartScreen(
      cartItems: cartItems,
    ),

    WishlistScreen(
      wishlistItems: wishlistItems,
      toggleWishlist: toggleWishlist,
    ),

    const MyOrdersScreen(),

    const ProfileScreen(),
  ];


  Widget homeContent() {

    final filteredProducts = products.where((product) {

      return product.name.toLowerCase().contains(searchText) ||
          product.code.toLowerCase().contains(searchText) ||
          product.category.toLowerCase().contains(searchText);

    }).toList();

  return Column(
  children: [
   
        const Padding(
  padding: EdgeInsets.only(left: 4, bottom: 6),
  child: Text(
    "Shop by Category",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    ),
  ),
),

        const SizedBox(height: 10),

        SizedBox(
          height: 45,

          child: ListView(
            scrollDirection: Axis.horizontal,

          children: [
  categoryChip("⭐ All"),
  categoryChip("💄 Cosmetics"),
  categoryChip("🥫 Kirana"),
  categoryChip("🧴 Personal Care"),
  categoryChip("🍫 Snacks"),
  categoryChip("👕 Fashion"),
  categoryChip("📱 Electronics"),
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
 Expanded(
  child: GridView.builder(
 shrinkWrap: false,          
 physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredProducts.length,

          gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),

          itemBuilder: (context, index) {

          final Product product = filteredProducts[index];

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
                    builder: (context) =>
                        ProductDetailsScreen(
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

onBuyNow: () {

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CheckoutScreen(
        cartItems: [
          CartItem(
            code: product.code,
            name: product.name,
            price: product.price,
            quantity: 1,
          ),
        ],
        totalAmount: double.parse(product.price),
      ),
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
          },
        ),
      ),
      ],
    );

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
   title: SizedBox(
  height: 40,
  child: TextField(
    onChanged: (value) {
      setState(() {
        searchText = value.toLowerCase();
      });
    },
    decoration: InputDecoration(
      hintText: "Search products...",
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
    ),
  ),
),

        actions: [

          IconButton(
            icon: const Icon(Icons.receipt_long),

            onPressed: () {

              setState(() {
                currentIndex = 4;
              });

            },
          ),


          IconButton(
            icon: const Icon(Icons.shopping_cart),

            onPressed: () {

              setState(() {
                currentIndex = 2;
              });

            },
          ),

        ],
      ),


      body: currentIndex == 0
          ? homeContent()
          : pages[currentIndex],


      bottomNavigationBar: BottomNav(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {

            currentIndex = index;

          });

        },

      ),

    );

 }  

Widget categoryChip(String title) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.blue.shade200,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

}

