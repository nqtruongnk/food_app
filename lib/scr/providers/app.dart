import 'package:flutter/material.dart';

enum SearchBy { PRODUCTS, RESTAURANTS }

class AppProvider with ChangeNotifier {
  bool isLoaing = false;
  SearchBy search = SearchBy.PRODUCTS;
  String filterBy = 'Products';

  void changeLoading() {
    isLoaing = !isLoaing;

    notifyListeners();
  }

  void changeSearchBy({SearchBy newSearchBy}) {
    search = newSearchBy;
    if (newSearchBy == SearchBy.PRODUCTS) {
      filterBy = 'Products';
    } else {
      filterBy = 'Restaurants';
    }
    notifyListeners();
  }
}
