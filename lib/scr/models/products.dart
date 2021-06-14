import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const RAITNG = 'rating';
  static const IAMGE = 'image';
  static const PRICE = 'price';
  static const RESTAURANT_ID = 'restaurantId';
  static const RETAURANT = 'restaurant';
  static const CATEGORY = 'category';
  static const FEATURED = 'featured';
  static const RATES = 'rates';

  String _id;
  String _name;
  String _rating;
  String _image;
  String _price;
  String _restaurantId;
  String _restaurant;
  String _category;
  int _rates;
  String _featured;

  String get id => _id;
  String get name => _name;
  String get rating => _rating;
  String get image => _image;
  String get price => _price;
  String get restaurantId => _restaurantId;
  String get category => _category;
  int get rates => _rates;
  String get featured => _featured;

  String get restaurant => _restaurant;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _rating = snapshot.data[RAITNG];
    _rates = snapshot.data[RATES];
    _image = snapshot.data[IAMGE];
    _restaurant = snapshot.data[RETAURANT];
    _restaurantId = snapshot.data[RESTAURANT_ID];
    _featured = snapshot.data[FEATURED];
    _category = snapshot.data[CATEGORY];
    _price = snapshot.data[PRICE];
  }
}
