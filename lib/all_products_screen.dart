import 'package:flutter/material.dart';
import 'data/product_data.dart';
import 'product_card.dart';
import 'cart_model.dart';
import 'product_details.dart';

class AllProductsScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final List<WishlistItem> wishlistItems;
  final Function(WishlistItem) toggleWishlist;

  const AllProductsScreen({
    super.key,
    required this.cartItems,
    required this.wishlistItems,
    required this.toggleWishlist,
  });

  @override
  State<AllProductsScreen> createState() =>
      _AllProductsScreenState();
}

class _AllProductsScreenState
    extends State<AllProductsScreen> {
  final TextEditingController searchController =
      TextEditingController();

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.50,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

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
            onAdd: () {
              widget.cartItems.add(
                CartItem(
                  code: product.code,
                  name: product.name,
                  price: product.price,
                  quantity: 1,
                ),
              );
              setState(() {});
            },
            onWishlist: () {
              widget.toggleWishlist(
                WishlistItem(
                  code: product.code,
                  name: product.name,
                  price: product.price,
                  image: product.image,
                ),
              );
            },
            isWishlisted: widget.wishlistItems.any(
              (item) => item.code == product.code,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    product: product,
                    onAdd: () {
                      widget.cartItems.add(
                        CartItem(
                          code: product.code,
                          name: product.name,
                          price: product.price,
                          quantity: 1,
                        ),
                      );
                      setState(() {});
                    },
                    onBuyNow: () {
                      widget.cartItems.add(
                        CartItem(
                          code: product.code,
                          name: product.name,
                          price: product.price,
                          quantity: 1,
                        ),
                      );
                      setState(() {});
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
