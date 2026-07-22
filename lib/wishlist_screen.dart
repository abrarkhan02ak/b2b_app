import 'package:flutter/material.dart';
import 'cart_model.dart';

class WishlistScreen extends StatelessWidget {
  final List<WishlistItem> wishlistItems;
  final Function(WishlistItem) toggleWishlist;

  const WishlistScreen({
    super.key,
    required this.wishlistItems,
    required this.toggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: wishlistItems.isEmpty
          ? const Center(
              child: Text("Wishlist is empty"),
            )
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];

                return ListTile(
                  leading: Image.asset(
                    item.image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(item.name),
                  subtitle: Text("₹${item.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      toggleWishlist(item);
                    },
                  ),
                );
              },
            ),
    );
  }
}
