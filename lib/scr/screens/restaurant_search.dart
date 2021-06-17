import 'package:app_food/scr/helpers/screen_navigation.dart';
import 'package:app_food/scr/helpers/style.dart';
import 'package:app_food/scr/providers/app.dart';
import 'package:app_food/scr/providers/product.dart';
import 'package:app_food/scr/providers/restaurant.dart';
import 'package:app_food/scr/screens/restaurant.dart';
import 'package:app_food/scr/widgets/custom_text.dart';
import 'package:app_food/scr/widgets/loading.dart';
import 'package:app_food/scr/widgets/product.dart';
import 'package:app_food/scr/widgets/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantSearchScreen extends StatelessWidget {
  const RestaurantSearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final app = Provider.of<AppProvider>(context);
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
          text: 'Restaurants',
          size: 30,
          color: grey,
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: app.isLoaing
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Loading()],
              ),
            )
          : restaurantProvider.searchRestaurant.length < 1
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
                        text: 'No Restaurant Founds',
                        color: grey,
                        weight: FontWeight.w300,
                        size: 22,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: restaurantProvider.searchRestaurant.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        app.changeLoading();
                        await productProvider.loadProductsByRestaurant(
                            restaurantId:
                                restaurantProvider.searchRestaurant[index].id);
                        changeScreen(
                            context,
                            RestaurantScreen(
                              restaurantModel:
                                  restaurantProvider.searchRestaurant[index],
                            ));
                        app.changeLoading();
                      },
                      child: RestaurantWidget(
                        restaurant: restaurantProvider.searchRestaurant[index],
                      ),
                    );
                  }),
    );
  }
}
