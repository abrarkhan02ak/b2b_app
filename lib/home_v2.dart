import 'package:flutter/material.dart';
import 'cart_model.dart';
import 'cart_screen.dart';
import 'my_orders_screen.dart';
import 'product_card.dart';
import 'data/product_data.dart';
import 'all_products_screen.dart';
import 'brand_products_screen.dart';
import 'product_details.dart';


class HomeV2 extends StatefulWidget {

  final List<CartItem> cartItems;
  final List<WishlistItem> wishlistItems;
  final Function(WishlistItem) toggleWishlist;


  const HomeV2({

    super.key,

    required this.cartItems,

    required this.wishlistItems,

    required this.toggleWishlist,

  });


  @override
  State<HomeV2> createState() => _HomeV2State();

}



class _HomeV2State extends State<HomeV2> {


  final TextEditingController searchController =
      TextEditingController();



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor: Colors.grey.shade100,


      appBar: AppBar(


        elevation: 0,

        backgroundColor: Colors.white,


        titleSpacing: 8,


        title: Container(


          height: 42,


          decoration: BoxDecoration(


            color: Colors.grey.shade100,


            borderRadius:
            BorderRadius.circular(12),


            border: Border.all(

              color: Colors.grey.shade300,

            ),

          ),


          child: TextField(


            controller: searchController,


            decoration: const InputDecoration(


              hintText:
              "Search products...",


              prefixIcon:
              Icon(Icons.search),


              border:
              InputBorder.none,


            ),


          ),


        ),



        actions: [



          IconButton(


            icon:
            const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),


            onPressed: () {


              Navigator.push(


                context,


                MaterialPageRoute(


                  builder: (context)=>

                  CartScreen(

                    cartItems:
                    widget.cartItems,

                  ),


                ),


              );


            },


          ),



          IconButton(


            icon:
            const Icon(

              Icons.receipt_long,

              color: Colors.black,

            ),


            onPressed: () {


              Navigator.push(


                context,


                MaterialPageRoute(


                  builder: (context)=>

                  const MyOrdersScreen(),


                ),


              );


            },


          ),


        ],


      ),



      body: SingleChildScrollView(

  child: Column(

    children: [

      const SizedBox(height: 10),

  Container(

  margin: const EdgeInsets.fromLTRB(
  12, 8, 12, 0,
),

  padding: const EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 18,
  ),
  height: 140,

  decoration: BoxDecoration(

    gradient: const LinearGradient(

      colors: [

        Colors.deepOrange,

        Colors.orange,

      ],

    ),

    borderRadius:
    BorderRadius.circular(24),

  ),

  child: Row(


    children: [

      Expanded(
      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(

            "🔥 Wholesale Mega Sale",

            style: TextStyle(

              color: Colors.white,

              fontSize: 22,

              fontWeight:
              FontWeight.bold,

            ),

          ),

          SizedBox(height: 8),

          Text(

            "Bulk orders • Best prices",

            style: TextStyle(

              color: Colors.white,

              fontSize: 14,

            ),

          ),

        ],

      ),

   ),
      Container(

        padding:
const EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 10,
),
        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(12),

        ),

          child: const Text(
  "50% OFF",
  style: TextStyle(
    color: Colors.deepOrange,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
),

      ),

    ],

  ),

),

      const SizedBox(height: 15),


  // Categories

      const Padding(

        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
                                                                                    child: Align(

          alignment:                                                                  Alignment.centerLeft,
                                                                                      child: Text(

            "Shop By Category",

            style: TextStyle(

              fontSize: 18,

              fontWeight:
              FontWeight.bold,

            ),

          ),

        ),

      ),



      const SizedBox(height: 10),



      SizedBox(

        height: 40,

        child: ListView(

          scrollDirection:
          Axis.horizontal,

          padding:
          const EdgeInsets.symmetric(
            horizontal: 12,
          ),


          children: [

            categoryChip("  ^p All", active: true),

            categoryChip("💄 Cosmetics"),

            categoryChip("🥫 Kirana"),

            categoryChip("🧴 Personal Care"),

            categoryChip("🍫 Snacks"),

          ],


        ),

      ),
    const SizedBox(height: 20),

    // Today's Deals Title

      const Padding(

        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),

        child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      "🔥 Today's Deals",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      "View All",
      style: TextStyle(
        color: Colors.deepOrange,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
),


      const SizedBox(height: 10),



      SizedBox(

        height: 190,

        child: ListView(

          scrollDirection:
          Axis.horizontal,


          padding:
          const EdgeInsets.symmetric(
            horizontal: 12,
          ),


          children: [


            dealCard(
              "Face Cream",
              "30% OFF",
              "₹120",
            ),


            dealCard(
              "Shampoo",
              "25% OFF",
              "₹99",
            ),




          ],

        ),

      ),



      const SizedBox(height: 15),



const Padding(

  padding: EdgeInsets.symmetric(
    horizontal: 12,
  ),

  child: Align(

    alignment: Alignment.centerLeft,

    child: Text(

     " Popular Products",

      style: TextStyle(

        fontSize: 18,

        fontWeight: FontWeight.bold,

      ),

    ),

  ),

),


const SizedBox(height: 14),


GridView.builder(

  shrinkWrap: true,

  physics:
  const NeverScrollableScrollPhysics(),


  padding:
  const EdgeInsets.symmetric(
    horizontal: 12,
  ),


  itemCount:
products.length > 6 ? 6 : products.length,


  gridDelegate:
  const SliverGridDelegateWithFixedCrossAxisCount(

    crossAxisCount: 2,

    crossAxisSpacing: 12,

    mainAxisSpacing: 12,

    childAspectRatio: 0.50,

  ),


  itemBuilder: (context, index) {


    final product =
    products[index];


    return ProductCard(

      code: product.code,

      name: product.name,

      price: product.price,

      image: product.image,

      stock: product.stock,

      rating: product.rating,

      originalPrice:
      product.originalPrice,

      discountPercent:
      product.discountPercent,

      offerText:
      product.offerText,

      packSize:
      product.packSize,

      moq:
      product.moq,


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


      isWishlisted:

      widget.wishlistItems.any(

        (item) =>
        item.code == product.code,

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

const SizedBox(height: 10),

Center(
  child: TextButton(
  
 onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => AllProductsScreen(
        cartItems: widget.cartItems,
        wishlistItems: widget.wishlistItems,
        toggleWishlist: widget.toggleWishlist,
      ),
    ),
  );
},

  child: const Text(
    "View All Products →",
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.deepOrange,
      ),
    ),
  ),
),

const SizedBox(height: 20),


const Padding(
  padding: EdgeInsets.symmetric(horizontal: 12),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "🏷 Top Brands",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 12),

SizedBox(
  height: 90,
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: 12),
    children: [
  brandCard(context, "HUL", Colors.blue),
  brandCard(context, "P&G", Colors.deepPurple),
  brandCard(context, "ITC", Colors.green),
  brandCard(context, "Dabur", Colors.orange),
  brandCard(context, "Nestlé", Colors.red),
],
  ),
),

const SizedBox(height: 20),


const Padding(

  padding: EdgeInsets.symmetric(
    horizontal: 12,
  ),

  child: Align(

    alignment: Alignment.centerLeft,

    child: Text(

      "Why Buy From Us?",

      style: TextStyle(

        fontSize: 20,

        fontWeight: FontWeight.bold,
        color: Colors.black87,

      ),

    ),

  ),

),


const SizedBox(height: 10),


SizedBox(

  height: 100,

  child: ListView(

    scrollDirection: Axis.horizontal,

    padding:
    const EdgeInsets.symmetric(
      horizontal: 12,
    ),

    children: [

      _featureCard(
        "🚚",
        "Fast Delivery",
        "Quick supply",
      ),

      _featureCard(
        "📦",
        "Bulk Order",
        "Wholesale price",
      ),

      _featureCard(
        "💰",
        "Best Price",
        "Retailer margin",
      ),

    ],

  ),

),

const SizedBox(height: 20),


const Padding(
  padding: EdgeInsets.symmetric(horizontal: 12),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "⭐ Recommended For You",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 14),

GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  padding: const EdgeInsets.symmetric(horizontal: 12),
  itemCount: products.length > 4 ? 4 : products.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    childAspectRatio: 0.50,
  ),
  itemBuilder: (context, index) {
    final product = products[(index + 2) % products.length];

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

const SizedBox(height: 20),


const Padding(
  padding: EdgeInsets.symmetric(horizontal: 12),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "💬 Customer Reviews",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 12),

Container(
  margin: const EdgeInsets.symmetric(horizontal: 12),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "⭐⭐⭐⭐⭐",
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 8),
      Text(
        "Very good wholesale prices and fast delivery. Highly recommended!",
        style: TextStyle(fontSize: 14),
      ),
      SizedBox(height: 10),
      Text(
        "- Amit General Store",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 20),



const Padding(
  padding: EdgeInsets.symmetric(horizontal: 12),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "📞 Need Help?",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 12),

Container(
  margin: const EdgeInsets.symmetric(horizontal: 12),
  padding: const EdgeInsets.all(18),
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color(0xFF25D366),
        Color(0xFF128C7E),
      ],
    ),
    borderRadius: BorderRadius.circular(18),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Row(
    children: [
      const CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.support_agent,
          color: Color(0xFF128C7E),
          size: 28,
        ),
      ),
      const SizedBox(width: 16),
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Need Help With Your Order?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Our support team is ready to help you.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      ElevatedButton(
        onPressed: null,
        child: Text("Contact"),
      ),
    ],
  ),
),

const SizedBox(height: 20),


const Padding(
  padding: EdgeInsets.symmetric(horizontal: 12),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "❤️ Thank You For Choosing Us",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 12),

Container(
  margin: const EdgeInsets.symmetric(horizontal: 12),
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 12,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Column(
    children: [

      const Icon(
        Icons.storefront,
        size: 48,
        color: Colors.deepOrange,
      ),

      const SizedBox(height: 12),

      const Text(
        "TEST 90 Wholesale",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      const Text(
        "Your trusted B2B wholesale shopping partner.\nQuality Products • Best Prices • Fast Delivery",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 18),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [

          Column(
            children: [
              Icon(Icons.verified,
                  color: Colors.green),
              SizedBox(height: 6),
              Text(
                "Trusted",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),

          Column(
            children: [
              Icon(Icons.local_shipping,
                  color: Colors.deepOrange),
              SizedBox(height: 6),
              Text(
                "Fast Delivery",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),

          Column(
            children: [
              Icon(Icons.support_agent,
                  color: Colors.blue),
              SizedBox(height: 6),
              Text(
                "24×7 Support",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),

        ],
      ),

      const SizedBox(height: 20),

      const Divider(),

      const SizedBox(height: 10),

      const Text(
        "Version 1.0.0",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),

      const SizedBox(height: 4),

      const Text(
        "© 2026 TEST 90 Wholesale",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 30),


    ],


  ),

),

    );


  }

Widget _featureCard(
  String icon,
  String title,
  String subtitle,
) {

  return Container(

    width: 220,

margin: const EdgeInsets.symmetric(horizontal: 10),

    padding:
    const EdgeInsets.all(18),

    decoration: BoxDecoration(

gradient: const LinearGradient(
  colors: [
    Color(0xFFFFFFFF),
    Color(0xFFF8F9FA),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
),

      borderRadius:
      BorderRadius.circular(18),

   boxShadow: [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 14,
    spreadRadius: 2,
    offset: const Offset(0, 6),
  ),
],

    ),

    child: Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(
          icon,
          style: const TextStyle(
            fontSize: 38,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          style: const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
),
        ),

         Text(
  subtitle,
  style: const TextStyle(
    fontSize: 13,
    color: Colors.black54,
  ),
),

      ],

    ),

  );

}

Widget dealCard(
    String name,
    String offer,
    String price,
) {

  return Container(

    width: 170,

    margin: const EdgeInsets.only(right: 16),

    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(

      color: Colors.white,

      borderRadius:
      BorderRadius.circular(20),

      boxShadow: const [

        BoxShadow(
  color: Colors.black12,
  blurRadius: 12,
  spreadRadius: 1,
  offset: Offset(0, 4),
),

      ],

    ),


    child: Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,


      children: [


        Container(

          padding:
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),

          decoration: BoxDecoration(

            color: Colors.red.shade50,

            borderRadius:
            BorderRadius.circular(8),

          ),


          child: Text(

            offer,

            style: const TextStyle(

              color: Colors.deepOrange,

              fontWeight:
              FontWeight.bold,

              fontSize: 13,

            ),

          ),

        ),


        const SizedBox(height: 12),


        Text(

          name,

          style: const TextStyle(

            fontSize: 16,

            fontWeight:
            FontWeight.bold,

          ),

        ),

      const SizedBox(height: 12),
        const Spacer(),


        Text(

          price,

          style: const TextStyle(

            fontSize: 20,

            fontWeight:
            FontWeight.bold,

          ),

        ),


        const SizedBox(height: 6),


        Container(

          width: double.infinity,

          padding:
          const EdgeInsets.symmetric(
            vertical: 10,
          ),

          decoration: BoxDecoration(

            color: Colors.orange,

            borderRadius:
            BorderRadius.circular(14),

          ),


          child: const Text(

            "Buy Now",

            textAlign:
            TextAlign.center,

            style: TextStyle(

              color: Colors.white,

              fontWeight:
              FontWeight.bold,

            ),

          ),

        ),

      ],

    ),

  );

}



Widget brandCard(
  BuildContext context,
  String name,
  Color color,
) {
  return AnimatedScale(
    duration: const Duration(milliseconds: 180),
    scale: 1,
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BrandProductsScreen(
              brandName: name,
              cartItems: widget.cartItems,
              wishlistItems: widget.wishlistItems,
              toggleWishlist: widget.toggleWishlist,
            ),
          ),
        );
      },

    child: Container(
      width: 125,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
  gradient: const LinearGradient(
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFF3E0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.orange.shade200,
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

const Align(
  alignment: Alignment.topRight,
  child: Padding(
    padding: EdgeInsets.only(top: 6, right: 6),
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          "TOP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
),

          CircleAvatar(
            radius: 24,
            backgroundColor: color,
            child: Text(
              name.substring(0, 1),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "View Products",
            style: TextStyle(
              fontSize: 11,
              color: Colors.deepOrange.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  )
  );
}



Widget categoryChip(String text, {bool active = false}) {

  return Container(

    margin: const EdgeInsets.only(right: 10),

    padding: const EdgeInsets.symmetric(
  horizontal: 22,
  vertical: 10,
),

    decoration: BoxDecoration(

  color: active ? Colors.deepOrange : Colors.white,

  borderRadius: BorderRadius.circular(30),

  border: Border.all(
  color: active ? Colors.deepOrange : Colors.grey.shade200,
),

boxShadow: [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 8,
    offset: Offset(0, 2),
  ),
],

),

    child: Center(

      child: Text(

        text,

        style: TextStyle(

  fontSize: 13,

  fontWeight: FontWeight.w600,

  color: active ? Colors.white : Colors.black87,

),

      ),

    ),

  );

}

}
