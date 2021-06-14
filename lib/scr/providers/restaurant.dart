import 'package:app_food/scr/helpers/restaurant.dart';

import 'package:app_food/scr/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantModel> restaurants = [];

  RestaurantProvider.initialize() {
    _loatRestaurants();
  }
  _loatRestaurants() async {
    restaurants = await _restaurantServices.getRestaurants();
    notifyListeners();
  }
}
