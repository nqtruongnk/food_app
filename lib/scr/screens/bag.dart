import 'package:app_food/scr/helpers/style.dart';
import 'package:app_food/scr/models/products.dart';
import 'package:app_food/scr/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ShoppingBag extends StatefulWidget {
  ShoppingBag({Key key}) : super(key: key);

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
            onPressed: null),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: 'Item Carts',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'images/shopping-bag.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                Positioned(
                  right: 7,
                  bottom: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            offset: Offset(2, 1),
                            blurRadius: 3,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: CustomText(
                        text: '2',
                        color: red,
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //     height: 120,
          //     decoration: BoxDecoration(color: white, boxShadow: [
          //       BoxShadow(
          //         color: Colors.red[50],
          //         offset: Offset(3, 5),
          //         blurRadius: 30,
          //       )
          //     ]),
          //     child: Row(
          //       children: [
          //         Image.asset(
          //           'images/${product.image}',
          //           height: 120,
          //           width: 120,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             RichText(
          //                 text: TextSpan(children: [
          //               TextSpan(
          //                   text: product.name + '\n',
          //                   style: TextStyle(color: black, fontSize: 20)),
          //               TextSpan(
          //                   text: '\$' + product.price.toString() + '\n',
          //                   style: TextStyle(
          //                       color: black,
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.bold)),
          //             ])),
          //             SizedBox(
          //               width: 100,
          //             ),
          //             IconButton(icon: Icon(Icons.delete), onPressed: null)
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
