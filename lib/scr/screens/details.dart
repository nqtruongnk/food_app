import 'package:app_food/scr/helpers/style.dart';
import 'package:app_food/scr/models/products.dart';
import 'package:app_food/scr/providers/app.dart';
import 'package:app_food/scr/providers/user.dart';
import 'package:app_food/scr/widgets/custom_text.dart';
import 'package:app_food/scr/widgets/loading.dart';
import 'package:app_food/scr/widgets/small_floatting_buttom.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final ProductModel product;

  const Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  GlobalKey _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(widget.product.image),
            ),
            SizedBox(
              height: 15,
            ),
            CustomText(
                text: widget.product.name, size: 26, weight: FontWeight.bold),
            CustomText(
                text: "\$${widget.product.price / 100}",
                size: 20,
                weight: FontWeight.w400),
            SizedBox(
              height: 10,
            ),
            CustomText(text: "Description", size: 18, weight: FontWeight.w400),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.product.description ?? 'null',
                textAlign: TextAlign.center,
                style: TextStyle(color: grey, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 36,
                      ),
                      onPressed: () {
                        if (quantity != 1) {
                          setState(() {
                            quantity -= 1;
                          });
                        }
                      }),
                ),
                GestureDetector(
                  onTap: () async {
                    app.changeLoading();
                    print('All set loading');
                    await user.addToCart(
                        product: widget.product, quantity: quantity);
                    // if (value) {
                    //   print('Item added to cart');
                    //   Scaffold.of(context).showSnackBar(
                    //       SnackBar(content: Text("Added to cart!")));
                    //   return;
                    // } else {
                    //   print('Item not added to cart');
                    // }

                    app.changeLoading();
                    print('Loading set to faild');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: app.isLoaing
                        ? Loading()
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                            child: CustomText(
                              text: "Add $quantity To Cart",
                              color: white,
                              size: 22,
                              weight: FontWeight.w300,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 36,
                        color: red,
                      ),
                      onPressed: () {
                        setState(() {
                          quantity += 1;
                        });
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
