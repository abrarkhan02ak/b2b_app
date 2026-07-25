import 'package:flutter/material.dart';
import 'product_card.dart';
import 'cart_model.dart';
import 'data/product_data.dart';
import 'cart_screen.dart';
import 'my_orders_screen.dart';

class HomeV2 extends StatefulWidget {
  final List<CartItem> cartItems;

  const HomeV2({
    super.key,
    required this.cartItems,
  });

  @override
  State<HomeV2> createState() => _HomeV2State();
}

class _HomeV2State extends State<HomeV2> {

  final ScrollController scrollController = ScrollController();

  double categoryHeight = 45;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      setState(() {

        if (scrollController.offset > 50) {
          categoryHeight = 38;
        } else {
          categoryHeight = 45;
        }

      });

    });
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
    ),

    child: const TextField(
      decoration: InputDecoration(
        hintText: "TEST 90 - Search",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
    ),
  ),

  actions: [

    IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CartScreen(
  cartItems: widget.cartItems,
),
    ),
  );
},
    ),

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

  ],
),

      body: CustomScrollView(
        controller: scrollController,

        slivers: [

          SliverToBoxAdapter(

            child: Padding(
              padding: const EdgeInsets.all(8),

              child: Container(

                height: 36,

                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),

                child: const Center(
                  child: Text(
                    "🔥 Today's Hot Deals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ),
            ),

          ),
          SliverToBoxAdapter(

            child: AnimatedContainer(

              duration: const Duration(milliseconds: 300),

              height: categoryHeight,

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

          ),

          SliverPadding(

            padding: const EdgeInsets.all(10),

            sliver: SliverGrid(

              delegate: SliverChildBuilderDelegate(

                (context, index) {

 return ProductCard(
  code: products[index].code,
  name: products[index].name,
  price: products[index].price,
  image: products[index].image,
  stock: products[index].stock,
  rating: products[index].rating,
  originalPrice: products[index].originalPrice,
  discountPercent: products[index].discountPercent,
  offerText: products[index].offerText,
  packSize: products[index].packSize,
  moq: products[index].moq,
  onAdd: () {},
  onTap: () {},
  onWishlist: () {},
  isWishlisted: false,
);

                },

                childCount: products.length,

              ),

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,

                crossAxisSpacing: 10,

                mainAxisSpacing: 10,

                childAspectRatio: 0.65,

              ),

            ),

          ),
        ],
      ),

    );

  }


  Widget categoryChip(String title) {

    return Padding(

      padding: const EdgeInsets.only(right: 10),

      child: Container(

        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),

        height: 38,

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: Colors.grey.shade300,
          ),

        ),

        child: Center(

          child: Text(

            title,

            style: const TextStyle(

              fontWeight: FontWeight.w600,

            ),

          ),

        ),

      ),

    );

  }

}
