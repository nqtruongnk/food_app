import 'package:app_food/scr/helpers/screen_navigation.dart';
import 'package:app_food/scr/helpers/style.dart';
import 'package:app_food/scr/providers/product.dart';
import 'package:app_food/scr/screens/details.dart';
import 'package:app_food/scr/widgets/custom_text.dart';
import 'package:app_food/scr/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatelessWidget {
  const ProductSearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(
          text: 'Products',
          size: 30,
          color: grey,
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: productProvider.productsSearched.length < 1
          ? Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: grey,
                    size: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'No products Founds',
                    color: grey,
                    weight: FontWeight.w300,
                    size: 22,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: productProvider.productsSearched.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    changeScreen(
                        context,
                        Details(
                            product: productProvider.productsSearched[index]));
                  },
                  child: ProductWidget(
                    product: productProvider.productsSearched[index],
                  ),
                );
              }),
    );
  }
}
