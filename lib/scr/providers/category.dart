import 'package:app_food/scr/helpers/category.dart';
import 'package:app_food/scr/models/category.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize() {
    _loatCategories();
  }
  _loatCategories() async {
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }
}
