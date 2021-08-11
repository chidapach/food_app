import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foods/helpers/screen_navigation.dart';
import 'package:foods/providers/auth.dart';
import 'package:foods/screens/bag.dart';
import 'package:foods/widgets/botttom_navigation_icons.dart';
import 'package:foods/widgets/categories.dart';
// ignore: unused_import
import 'package:foods/widgets/custom_text.dart';
import 'package:foods/widgets/featured_products.dart';
import 'package:foods/widgets/small_floating_button.dart';
import '../helpers/style.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: black,
        title: CustomText(
          text: "FoodApp",
          color: black,
          size: 16,
          weight: FontWeight.normal,
        ),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
              onPressed: () {
                changeScreen(context, ShoppingBag());
              }, 
              icon: Icon(Icons.shopping_cart),
              
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
          // Stack(
          //   children: [
          //     IconButton(
          //         onPressed: () {}, icon: Icon(Icons.notifications_none)),
          //     Positioned(
          //       top: 12,
          //       right: 12,
          //       child: Container(
          //         height: 10,
          //         width: 10,
          //         decoration: BoxDecoration(
          //             color: red, borderRadius: BorderRadius.circular(20)),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // UserAccountsDrawerHeader(
            //   accountName: CustomText(
            //     text: authProvider.userModel.name,
            //     color: white,
            //     weight: FontWeight.bold,
            //     size: 18,
            //   ),
            //   accountEmail: CustomText(
            //     text: authProvider.userModel.email,
            //     color: grey,
            //     weight: FontWeight.bold,
            //     size: 18,
            //   ),
            // ),
            ListTile(
              leading: Icon(Icons.home),
              title: CustomText(
                  text: "Home",
                  color: black,
                  size: 16,
                  weight: FontWeight.normal),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: CustomText(
                  text: "Account",
                  color: black,
                  size: 16,
                  weight: FontWeight.normal),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: CustomText(
                  text: "Cart",
                  color: black,
                  size: 16,
                  weight: FontWeight.normal),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: Container(
        decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 15),
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  color: red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.grey.shade400, offset: Offset(1, 1), blurRadius: 4)
                        // ]
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.search,
                          color: red,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                              hintText: "Find food and restaurents",
                              border: InputBorder.none),
                        ),
                        trailing: Icon(
                          Icons.filter_list,
                          color: red,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Categories(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "Featured",
                    color: grey,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                ),
                Featured(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "Popular",
                    color: grey,
                    size: 20,
                    weight: FontWeight.normal,
                  ),
                ),
                // strat here
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("images/food.jpg")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SmallButton(Icons.favorite, icon: Icons.favorite),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                width: 50,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow[300],
                                        size: 20,
                                      ),
                                    ),
                                    Text("4.5")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.05),
                                Colors.black.withOpacity(0.025),
                              ],
                            ),
                          ),
                        ),
                      )),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 8, 8, 8),
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Pancakes \n",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                        TextSpan(
                                          text: "by: ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: white),
                                        ),
                                        TextSpan(
                                          text: "Pizza hut",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                      ], style: TextStyle(color: black)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "\$12.99 \n",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.normal,
                                                color: white))
                                      ], style: TextStyle(color: black)),
                                    ),
                                  )
                                ],
                              ))),
                    ],
                  ),
                ),
                //end here
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 80,
      //   color: white,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: <Widget>[
      //         BottomNavIcon(
      //           onTap: () {},
      //           image: "home.png",
      //           name: "Home",
      //         ),
      //         BottomNavIcon(
      //           onTap: () {},
      //           image: "target.png",
      //           name: "Near by",
      //         ),
      //         BottomNavIcon(
      //           onTap: () {
      //             changeScreenReplacement(context, ShoppingBag());
      //             //changeScreen(context, ShoppingBag());
      //           },
      //           image: "shopping-bag.png",
      //           name: "Bag",
      //         ),
      //         BottomNavIcon(
      //           onTap: () {},
      //           image: "avatar.png",
      //           name: "Account",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
