import 'package:flutter/material.dart';
import 'data/product_data.dart';
import 'product_card.dart';
import 'cart_model.dart';
import 'product_details.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String category;
  final Function(CartItem) addToCart;
  final List<WishlistItem> wishlistItems;
  final Function(WishlistItem) toggleWishlist;

  const CategoryProductsScreen({
  super.key,
  required this.category,
  required this.addToCart,
  required this.wishlistItems,
  required this.toggleWishlist,
});

  @override
  Widget build(BuildContext context) {
 final categoryProducts = products
    .where((product) => product.category == category)
    .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
  itemCount: categoryProducts.length,
  itemBuilder: (context, index) {
    final product = categoryProducts[index];

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
  addToCart(
    CartItem(
      code: product.code,
      name: product.name,
      price: product.price,
      quantity: 1,
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
              quantity: 1,
            ),
          );
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
