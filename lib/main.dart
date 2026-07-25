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
import 'package:marquee/marquee.dart';
import 'home_v2.dart';

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
double categoryFontSize = 14;

 @override
void initState() {
  super.initState();

  productScrollController.addListener(() {
  setState(() {
    if (productScrollController.offset > 20) {
      categoryHeight = 38;
      categoryFontSize = 11;
    } else {
      categoryHeight = 45;
      categoryFontSize = 14;
    }
  });
});
}
 
final List<CartItem> cartItems = [];
  final List<WishlistItem> wishlistItems = [];

  String searchText = "";
  String selectedCategory = "All";

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
   
  Padding(
  padding: const EdgeInsets.only(left: 8,
 right: 8, bottom: 6),
  child: Container(
    height: 36,
    decoration: BoxDecoration(
      color: Colors.amber.shade100,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.amber.shade700),
    ),
    child:  Row(
      children: [
        SizedBox(width: 8),
        Icon(Icons.campaign, color: Colors.red),
        SizedBox(width: 8),
     Expanded(
  child: Marquee(
    text: 'Welcome to TEST 90 Wholesale - '
      'Best Offers Every Day',
    style: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
    scrollAxis: Axis.horizontal,
    blankSpace: 40.0,
    velocity: 30.0,
    pauseAfterRound: const Duration(seconds: 1),
    startPadding: 10.0,
  ),
),
      ],
    ),
  ),
),

Padding(
  padding: const EdgeInsets.only(
    left: 8,
    right: 8,
    bottom: 8,
  ),
  child: SizedBox(
    height: 110,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        hotDealCard("🔥 Face Cream", "₹120", "30% OFF"),
        hotDealCard("🔥 Shampoo", "₹99", "25% OFF"),
        hotDealCard("🔥 Soap Pack", "₹180", "40% OFF"),
      ],
    ),
  ),
),
       
 AnimatedContainer(
  duration: const Duration(milliseconds: 400),
  height: categoryHeight,
  decoration: BoxDecoration(
  boxShadow: [
    BoxShadow(
      blurRadius: 8.0,
offset: const Offset(0, 3),
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
  title: Container(
    height: 38,
    decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(8),
  border: Border.all(
    color: Colors.grey.shade600,
    width: 1.3,
  ),
),
    child: Row(
      children: [

        Expanded(
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value.toLowerCase();
              });
            },
   decoration: InputDecoration(
  hintText: "TEST 90 - Search",
  prefixIcon: const Icon(Icons.search),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
  color: Colors.grey,
  width: 1.2,
    ),
  ),
  contentPadding: EdgeInsets.zero,
),
          ),
        ),

        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            setState(() {
              currentIndex = 2;
            });
          },
        ),

        IconButton(
          icon: const Icon(Icons.receipt_long),
          onPressed: () {
            setState(() {
              currentIndex = 4;
            });
          },
        ),

      ],
    ),
  ),
),


      body: currentIndex == 0
    ? HomeV2(
        cartItems: cartItems,
      )
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












 
Widget hotDealCard(String name, String price, String offer) {
  return Container(
    width: 170,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.red.shade50,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.red.shade300),
      boxShadow: const [
        BoxShadow(
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          offer,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(
          price,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: selectedCategory == title
              ? Colors.blue
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedCategory == title
                ? Colors.blue
                : Colors.grey.shade300,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selectedCategory == title
                  ? Colors.white
                  : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );
}
}
