import 'package:flutter/material.dart';

import 'product_card.dart';
import 'cart_screen.dart';
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

  final FocusNode searchFocus = FocusNode();

  String searchText = "";

  String selectedCategory = "All";


  final List<CartItem> cartItems = [];

  final List<WishlistItem> wishlistItems = [];



  void addToCart(CartItem item){

    setState((){

      final index = cartItems.indexWhere(
        (e)=> e.code == item.code
      );


      if(index >= 0){

        cartItems[index].quantity++;

      }else{

        cartItems.add(item);

      }

    });

  }



  void toggleWishlist(WishlistItem item){

    setState((){

      final index = wishlistItems.indexWhere(
        (e)=> e.code == item.code
      );


      if(index >=0){

        wishlistItems.removeAt(index);

      }else{

        wishlistItems.add(item);

      }

    });

  }



  Widget homeContent(){

    final filteredProducts = products.where((product){

final search =
    product.name.toLowerCase().contains(searchText) ||
    product.code.toLowerCase().contains(searchText) ||
    product.category.toLowerCase().contains(searchText);

      final category =
          selectedCategory == "All" ||
          product.category == selectedCategory;


      return search && category;


    }).toList();


    return Column(

      children: [

        SizedBox(
          height: 45,

          child: ListView(

            scrollDirection: Axis.horizontal,

            children: [

              categoryChip("All"),
              categoryChip("Cosmetics"),
              categoryChip("Kirana"),
              categoryChip("Personal Care"),

            ],

          ),

        ),


        Expanded(

          child: GridView.builder(

            itemCount: filteredProducts.length,

            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,

              childAspectRatio: 0.65,

            ),


            itemBuilder: (context,index){

              Product product = filteredProducts[index];

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

                onAdd: (){

                  addToCart(

                    CartItem(

                      code: product.code,

                      name: product.name,

                      price: product.price,

                      quantity: 1,

                    ),

                  );

                },

                onTap: (){



                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (context)=> ProductDetailsScreen(

                        product: product,

                        onAdd: (){},

                        onBuyNow: (){},

                      ),

                    ),

                  );


                },

                onWishlist: (){},


                isWishlisted: false,

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

          height: 42,

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(25),

          ),

          child: Row(

            children: [

              Expanded(

                child: TextField(

                  focusNode: searchFocus,

                  onChanged: (value){

                    setState((){

                      searchText =
                          value.toLowerCase();

                    });

                  },


                  decoration: const InputDecoration(

                    hintText: "Search products",

                    prefixIcon:
                    Icon(Icons.search),

                    border: InputBorder.none,

                  ),

                ),

              ),


              IconButton(

                icon:
                const Icon(Icons.receipt_long),

                onPressed: (){

                  setState((){

                    currentIndex = 4;

                  });

                },

              ),


              IconButton(

                icon:
                const Icon(Icons.shopping_cart),

                onPressed: (){

                  setState((){

                    currentIndex = 2;

                  });

                },

              ),


            ],

          ),

        ),

      ),



      body:

      currentIndex == 0

      ? homeContent()

      : pages[currentIndex],



      bottomNavigationBar: BottomNav(

        currentIndex: currentIndex,


        onTap: (index){

          setState((){

            currentIndex = index;

          });

        },

      ),


    );

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




  Widget categoryChip(String title){

    return Padding(

      padding:
      const EdgeInsets.all(6),


      child: GestureDetector(

        onTap: (){

          setState((){

            selectedCategory = title;

          });

        },


        child: Container(

          padding:
          const EdgeInsets.symmetric(

            horizontal: 16,

            vertical: 8,

          ),


          decoration: BoxDecoration(

            borderRadius:
            BorderRadius.circular(20),


            border: Border.all(

              color:

              selectedCategory == title

              ? Colors.blue

              : Colors.grey,

            ),

          ),


          child: Text(title),


        ),

      ),

    );

  }


}
