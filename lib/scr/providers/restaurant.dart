import 'package:app_food/scr/helpers/restaurant.dart';

import 'package:app_food/scr/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantModel> restaurants = [];
  RestaurantModel restaurant;
  List<RestaurantModel> searchRestaurant = [];

  RestaurantProvider.initialize() {
    _loatRestaurants();
  }
  _loatRestaurants() async {
    restaurants = await _restaurantServices.getRestaurants();
    notifyListeners();
  }

  loadSingleRestaurant({int restaurantId}) async {
    restaurant = await _restaurantServices.getRestaurantById(id: restaurantId);
    notifyListeners();
  }

  Future search({String name}) async {
    searchRestaurant =
        await _restaurantServices.searchRestaurant(restaurantName: name);
    print('Restaurant are: ${searchRestaurant.length}');
    notifyListeners();
  }
}
