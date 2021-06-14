import 'package:app_food/scr/models/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantServices {
  String collection = 'restaurants';
  Firestore _firestore = Firestore.instance;

  Future<List<RestaurantModel>> getRestaurants() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<RestaurantModel> restaurants = [];
        for (DocumentSnapshot restaurant in result.documents) {
          restaurants.add(RestaurantModel.fromSnapshot(restaurant));
        }
        return restaurants;
      });
}
