import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const NAME = 'name';
  static const ID = 'id';
  static const AVG_PRICE = 'avgPrice';
  static const RATING = 'rating';
  static const RATES = 'ratess';
  static const IMAGE = 'image';
  static const POPULAR = 'popular';

  int _id;
  String _name;
  double _avgPrice;
  double _rating;
  String _image;
  bool _popular;
  int _rates;

  int get id => _id;
  String get name => _name;
  String get image => _image;
  double get avgPrice => _avgPrice;
  double get rating => _rating;
  bool get popular => _popular;
  int get rates => _rates;

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _avgPrice = snapshot.data[AVG_PRICE];
    _image = snapshot.data[IMAGE];
    _popular = snapshot.data[POPULAR];
    _rating = snapshot.data[RATING];
    _rates = snapshot.data[RATES];
  }
}
