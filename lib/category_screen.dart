import 'package:flutter/material.dart';
import 'category_products_screen.dart';
import 'cart_model.dart';

class CategoryScreen extends StatelessWidget {
  final Function(CartItem) addToCart;
  final List<WishlistItem> wishlistItems;
final Function(WishlistItem) toggleWishlist;

  const CategoryScreen({
  super.key,
  required this.addToCart,
  required this.wishlistItems,
  required this.toggleWishlist,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
  leading: Icon(Icons.shopping_bag),
  title: Text("Cosmetics"),
  onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => 
     CategoryProductsScreen(
  category: "Cosmetics",
  addToCart: addToCart,
    wishlistItems: wishlistItems,
  toggleWishlist: toggleWishlist,
),
    ),
  );
},
),
          ListTile(
            leading: Icon(Icons.cleaning_services),
            title: Text("Personal Care"),
          ),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Grocery"),
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text("Other Products"),
          ),
        ],
      ),
    );
  }
}
