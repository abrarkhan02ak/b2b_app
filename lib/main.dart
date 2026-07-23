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
final ScrollController
 productScrollController = ScrollController();
 double categoryHeight = 45;
 String selectedCategory = "All Categories";
 double searchBarHeight = 40;
final FocusNode searchFocus = FocusNode();
double categoryFontSize = 14;

 @override
void initState() {
  super.initState();

  productScrollController.addListener(() {
  setState(() {
    if (productScrollController.offset > 20) {
  categoryHeight = 38;
  categoryFontSize = 11;

  if (!searchFocus.hasFocus) {
    searchBarHeight = 32;
  }
} else {
  categoryHeight = 45;
  categoryFontSize = 14;
  searchBarHeight = 40;
}
  });
});
  searchFocus.addListener(() {
  setState(() {
    if (searchFocus.hasFocus) {
      searchBarHeight = 40;
    } else if (productScrollController.offset > 20) {
      searchBarHeight = 32;
    }
  });
});
}
 
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

  final matchesSearch =
      product.name.toLowerCase().contains(searchText) ||
      product.code.toLowerCase().contains(searchText) ||
      product.category.toLowerCase().contains(searchText);

  final matchesCategory =
      selectedCategory == "All Categories" ||
      product.category == selectedCategory;

  return matchesSearch && matchesCategory;

}).toList();

  return Column(
  children: [
   
        AnimatedContainer(
  duration: const Duration(milliseconds: 400),
  height: categoryHeight,
  decoration: BoxDecoration(
  boxShadow: [
    BoxShadow(
  color: Colors.grey.withValues(alpha: 0.15),
  blurRadius: 6,
  offset: const Offset(0, 2),
),
  ],
),

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
 controller: productScrollController,

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
   title: AnimatedContainer(
  duration: const Duration(milliseconds: 250),
  height: searchBarHeight,
  child: TextField(
    focusNode: searchFocus,
    onTap: () {
      setState(() {
        searchBarHeight = 40;
      });
    },
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
    child: GestureDetector(
  onTap: () {
    setState(() {
      selectedCategory = title;
    });
  },
  child: Container(
      padding: EdgeInsets.symmetric(
  horizontal: categoryHeight == 38 ? 12 : 16,
  vertical: categoryHeight == 38 ? 6 : 10,
),
      decoration: BoxDecoration(
  color: selectedCategory == title
    ? Colors.blue.shade100
    : Colors.grey.shade50,
  borderRadius: BorderRadius.circular(25),
  border: Border.all(
    color: selectedCategory == title
    ? Colors.blue
    : Colors.grey.shade300,
  ),
),
            child: Text(
        title,
        style: TextStyle(
          fontSize: categoryFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  );
}
}
