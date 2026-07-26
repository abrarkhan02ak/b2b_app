import 'package:flutter/material.dart';
import 'cart_model.dart';
import 'my_orders_screen.dart';
import 'bottom_nav.dart';
import 'category_screen.dart';
import 'profile_screen.dart';
import 'order_data.dart';
import 'wishlist_screen.dart';
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
 
final List<CartItem> cartItems = [];
  final List<WishlistItem> wishlistItems = [];


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

    HomeV2(
  cartItems: cartItems,
  wishlistItems: wishlistItems,
  toggleWishlist: toggleWishlist,
),

    WishlistScreen(
      wishlistItems: wishlistItems,
      toggleWishlist: toggleWishlist,
    ),

    const MyOrdersScreen(),

    const ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {

  return Scaffold(

      body: currentIndex == 0
    ? HomeV2(
        cartItems: cartItems,
        wishlistItems: wishlistItems,
        toggleWishlist: toggleWishlist,
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

}
