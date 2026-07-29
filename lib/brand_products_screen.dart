import 'package:flutter/material.dart';
import 'data/product_data.dart';
import 'product_card.dart';
import 'cart_model.dart';
import 'product_details.dart';

class BrandProductsScreen extends StatefulWidget {
  final String brandName;
  final List<CartItem> cartItems;
final List<WishlistItem> wishlistItems;
final Function(WishlistItem) toggleWishlist;

  const BrandProductsScreen({
    super.key,
    required this.brandName,
    required this.cartItems,
required this.wishlistItems,
required this.toggleWishlist,
  });
 @override
State<BrandProductsScreen> createState() =>
    _BrandProductsScreenState();
}

class _BrandProductsScreenState
    extends State<BrandProductsScreen> {
  @override
  Widget build(BuildContext context) {
  final brandProducts =
    products.where((p) => p.brand == widget.brandName).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brandName),
        centerTitle: true,
      ),
      body: ListView.builder(
  padding: const EdgeInsets.all(16),
  itemCount: brandProducts.length,
  itemBuilder: (context, index) {
    final product = brandProducts[index];

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
      builder: (_) => ProductDetailsScreen(
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
