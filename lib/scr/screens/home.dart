import 'dart:ui';

import 'package:app_food/scr/helpers/screen_navigation.dart';
import 'package:app_food/scr/helpers/style.dart';
import 'package:app_food/scr/screens/bag.dart';
import 'package:app_food/scr/widgets/bottom_navigation_icons.dart';
import 'package:app_food/scr/widgets/categories.dart';
import 'package:app_food/scr/widgets/custom_text.dart';
import 'package:app_food/scr/widgets/featured_products.dart';
import 'package:app_food/scr/widgets/small_floatting_buttom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomText(
                    text: 'What would you like to eat?',
                    size: 18,
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                        icon: Icon(Icons.notifications_none), onPressed: () {}),
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(1, 1),
                    blurRadius: 4,
                  )
                ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: 'Find food and restaurants',
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: red,
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
                text: 'Featured',
                size: 20,
                color: grey,
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Popular',
                size: 20,
                color: grey,
              ),
            ),

            //start
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('images/food.jpeg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallButton(
                          icon: Icons.favorite,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text('4.5'),
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
                            )),
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'Pancakes \n',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: white),
                            ),
                            TextSpan(
                              text: 'by: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: grey),
                            ),
                            TextSpan(
                              text: 'Pizza hut',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: white),
                            )
                          ], style: TextStyle(color: black))),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '\$12.00 \n',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: white,
                                    fontWeight: FontWeight.w300))
                          ], style: TextStyle(color: black))),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            //end
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: white,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavIcon(
                image: 'home.jpg',
                name: 'Home',
              ),
              BottomNavIcon(
                image: 'target.png',
                name: 'Near by',
              ),
              BottomNavIcon(
                onTap: () {
                  changeScreen(context, ShoppingBag());
                },
                image: 'shopping-bag.png',
                name: 'Cart',
              ),
              BottomNavIcon(
                image: 'avatar.png',
                name: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
