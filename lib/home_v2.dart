import 'package:flutter/material.dart';
import 'cart_model.dart';
import 'cart_screen.dart';
import 'my_orders_screen.dart';
import 'product_card.dart';
import 'data/product_data.dart';


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



      // Today's Deals Title

      const Padding(

        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),

        child: Align(

          alignment: Alignment.centerLeft,

          child: Text(

            "🔥 Today's Deals",

            style: TextStyle(

              fontSize: 18,

              fontWeight: FontWeight.bold,

            ),

          ),

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



      // Categories

      const Padding(

        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),

        child: Align(

          alignment:
          Alignment.centerLeft,

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


const Padding(

  padding: EdgeInsets.symmetric(
    horizontal: 12,
  ),

  child: Align(

    alignment: Alignment.centerLeft,

    child: Text(

      "🔥 Popular Products",

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

    childAspectRatio: 0.62,

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


      onTap: () {},


    );

  },


),

const SizedBox(height: 10),

Center(
  child: TextButton(
  onPressed: () {
    // open all products later
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

  padding: EdgeInsets.symmetric(
    horizontal: 12,
  ),

  child: Align(

    alignment: Alignment.centerLeft,

    child: Text(

      "🔥 Today's Deals",

      style: TextStyle(

        fontSize: 18,

        fontWeight: FontWeight.bold,

      ),

    ),

  ),

),


const SizedBox(height: 10),


Container(

  margin: const EdgeInsets.symmetric(
    horizontal: 12,
  ),

  padding: const EdgeInsets.all(16),


  decoration: BoxDecoration(

    gradient: const LinearGradient(

      colors: [

        Colors.orange,

        Colors.deepOrange,

      ],

    ),

    borderRadius:
    BorderRadius.circular(18),

  ),


  child: Row(

    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,


    children: [

      Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [

          const Text(

            "Wholesale Mega Offer",

            style: TextStyle(

              color: Colors.white,

              fontSize: 18,

              fontWeight:
              FontWeight.bold,

            ),

          ),


          const SizedBox(height: 6),


          const Text(

            "Save more on bulk orders",

            style: TextStyle(

              color: Colors.white,

              fontSize: 13,

            ),

          ),

        ],

      ),


      Container(

        padding:
        const EdgeInsets.all(12),


        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(12),

        ),


        child: const Text(

          "40% OFF",

          style: TextStyle(

            color: Colors.deepOrange,

            fontWeight:
            FontWeight.bold,

          ),

        ),

      ),

    ],

  ),

),

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

    width: 200,

    margin:
    const EdgeInsets.only(right: 10),

    padding:
    const EdgeInsets.all(18),

    decoration: BoxDecoration(

      color: Colors.white,

      borderRadius:
      BorderRadius.circular(18),

      boxShadow: const [

        BoxShadow(

          blurRadius: 8,

          offset: Offset(0,2),

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
            fontSize: 30,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          style: const TextStyle(
  fontSize: 15,
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

    margin: const EdgeInsets.only(right: 12),

    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(

      color: Colors.white,

      borderRadius:
      BorderRadius.circular(18),

      boxShadow: const [

        BoxShadow(

          blurRadius: 8,

          offset: Offset(0, 3),

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
            vertical: 6,
          ),

          decoration: BoxDecoration(

            color: Colors.orange,

            borderRadius:
            BorderRadius.circular(10),

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

Widget categoryChip(String text, {bool active = false}) {

  return Container(

    margin: const EdgeInsets.only(right: 6),

    padding: const EdgeInsets.symmetric(
  horizontal: 18,
  vertical: 7,
),

    decoration: BoxDecoration(

  color: active ? Colors.deepOrange : Colors.white,

  borderRadius: BorderRadius.circular(24),

  border: Border.all(

    color: active ? Colors.deepOrange : Colors.grey.shade200,

  ),

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
