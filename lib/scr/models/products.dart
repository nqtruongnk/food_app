import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const RAITNG = 'rating';
  static const IAMGE = 'image';
  static const PRICE = 'price';
  static const RESTAURANT_ID = 'restaurantId';
  static const RETAURANT = 'restaurant';
  static const DESCRIPTION = 'description';
  static const CATEGORY = 'category';
  static const FEATURED = 'featured';
  static const RATES = 'rates';

  String _id;
  String _name;
  double _rating;
  String _image;
  double _price;
  int _restaurantId;
  String _restaurant;
  String _category;
  int _rates;
  bool _featured;
  String _description;

  String get id => _id;
  String get name => _name;
  double get rating => _rating;
  String get image => _image;
  double get price => _price;
  int get restaurantId => _restaurantId;
  String get category => _category;
  int get rates => _rates;
  bool get featured => _featured;
  String get description => _description;
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
    _description = snapshot.data[DESCRIPTION];
  }
}
