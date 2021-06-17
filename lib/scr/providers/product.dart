import 'package:app_food/scr/helpers/product.dart';

import 'package:app_food/scr/models/products.dart';

import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByRestaurant = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    _loadProducts();
  }

  _loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory =
        await _productServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  Future loadProductsByRestaurant({int restaurantId}) async {
    productsByRestaurant =
        await _productServices.getProductsByRestaurant(id: restaurantId);
    notifyListeners();
  }

  Future search({String productName}) async {
    productsSearched =
        await _productServices.searchProducts(productName: productName);
    print('The number of product detected: ${productsSearched.length}');
    print('The number of product detected: ${productsSearched.length}');
    print('The number of product detected: ${productsSearched.length}');
    notifyListeners();
  }
}
