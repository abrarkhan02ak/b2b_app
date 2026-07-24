import 'package:flutter/material.dart';
import 'product_card.dart';
import 'cart_screen.dart';
import 'checkout_screen.dart';
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

  final ScrollController productScrollController =
      ScrollController();

  final FocusNode searchFocus = FocusNode();

  double categoryHeight = 45;
  double categoryFontSize = 14;

  double searchBarHeight = 40;
  double searchPadding = 12;
  double iconSize = 24;

  String selectedCategory = "All Categories";
  String searchText = "";


  @override
  void initState() {
    super.initState();

    productScrollController.addListener(() {

      if (!mounted) return;

      setState(() {

        if (productScrollController.offset > 20) {

          categoryHeight = 38;
          categoryFontSize = 11;

          if (!searchFocus.hasFocus) {
            searchBarHeight = 34;
          }

          searchPadding = 8;
          iconSize = 20;

        } else {

          categoryHeight = 45;
          categoryFontSize = 14;

          if (!searchFocus.hasFocus) {
            searchBarHeight = 40;
          }

          searchPadding = 12;
          iconSize = 24;
        }

      });

    });


    searchFocus.addListener(() {

      if (!mounted) return;

      setState(() {

        if (searchFocus.hasFocus) {
          searchBarHeight = 40;
        }

      });

    });

  }


  final List<CartItem> cartItems = [];

  final List<WishlistItem> wishlistItems = [];


  void addToCart(CartItem item) {

    setState(() {

      final index = cartItems.indexWhere(
        (e) => e.code == item.code,
      );

      if (index >= 0) {
        cartItems[index].quantity++;
      } else {
        cartItems.add(item);
      }

    });

  }
  void toggleWishlist(WishlistItem item) {

    setState(() {

      final index = wishlistItems.indexWhere(
        (e) => e.code == item.code,
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


  Widget homeContent() {

    final filteredProducts = products.where((product) {

      final matchesSearch =
          product.name.toLowerCase().contains(searchText) ||
          product.code.toLowerCase().contains(searchText) ||
          product.category.toLowerCase().contains(searchText);


      final matchesCategory =
          selectedCategory == "All Categories" ||
          product.category == selectedCategory;


      return matchesSearch && matchesCategory;


    }).toList();


    return Column(
      children: [

        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
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


        Expanded(
          child: GridView.builder(
            controller: productScrollController,

            itemCount: filteredProducts.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.65,
            ),


            itemBuilder: (context, index) {

              final Product product =
                  filteredProducts[index];


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
                moq: product.moq,                onTap: () {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(

                        product: product,

                        onAdd: () {

                          addToCart(
                            CartItem(
                              code: product.code,
                              name: product.name,
                              price: product.price,
                            ),
                          );

                        },


                        onBuyNow: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                                  CheckoutScreen(
                                cartItems: [
                                  CartItem(
                                    code: product.code,
                                    name: product.name,
                                    price: product.price,
                                    quantity: 1,
                                  ),
                                ],

                                totalAmount:
                                    double.parse(product.price),
                              ),
                            ),
                          );

                        },

                      ),
                    ),
                  );

                },


                onAdd: () {

                  addToCart(
                    CartItem(
                      code: product.code,
                      name: product.name,
                      price: product.price,
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


              );

            },

          ),

        ),

      ],

    );

  }  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        titleSpacing: 0,

        title: AnimatedContainer(

          duration: const Duration(milliseconds: 250),

          height: searchBarHeight,

          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),

          padding: EdgeInsets.symmetric(
            horizontal: searchPadding,
          ),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(30),

            boxShadow: const [

              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0,2),
              ),

            ],

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


                  decoration: InputDecoration(

                    hintText:
                        "Search products...",

                    prefixIcon: Icon(
                      Icons.search,
                      size: iconSize,
                    ),

                    border:
                        InputBorder.none,

                  ),

                ),

              ),



              IconButton(

                padding: EdgeInsets.zero,

                constraints:
                    const BoxConstraints(),

                icon: Icon(
                  Icons.receipt_long,
                  size: iconSize,
                ),

                onPressed: (){

                  setState((){

                    currentIndex = 4;

                  });

                },

              ),



              const SizedBox(
                width: 8,
              ),



              IconButton(

                padding: EdgeInsets.zero,

                constraints:
                    const BoxConstraints(),

                icon: Icon(
                  Icons.shopping_cart,
                  size: iconSize,
                ),

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



      body: currentIndex == 0
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



  Widget categoryChip(String title){

    return Padding(

      padding:
          const EdgeInsets.only(right:10),


      child: GestureDetector(

        onTap: (){

          setState((){

            selectedCategory = title;

          });

        },


        child: Container(

          padding: EdgeInsets.symmetric(

            horizontal:
                categoryHeight == 38
                ? 12
                : 16,

            vertical:
                categoryHeight == 38
                ? 6
                : 10,

          ),


          decoration: BoxDecoration(

            color:
              selectedCategory == title
              ? Colors.blue.shade100
              : Colors.grey.shade50,


            borderRadius:
                BorderRadius.circular(25),


            border: Border.all(

              color:
              selectedCategory == title
              ? Colors.blue
              : Colors.grey.shade300,

            ),

          ),



          child: Text(

            title,

            style: TextStyle(

              fontSize: categoryFontSize,

              fontWeight:
                  FontWeight.w600,

            ),

          ),

        ),

      ),

    );

  }

}
