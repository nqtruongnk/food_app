import 'package:app_food/scr/models/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantServices {
  String collection = 'restaurants';
  Firestore _firestore = Firestore.instance;
  RestaurantModel restaurant;

  Future<List<RestaurantModel>> getRestaurants() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<RestaurantModel> restaurants = [];
        for (DocumentSnapshot restaurant in result.documents) {
          restaurants.add(RestaurantModel.fromSnapshot(restaurant));
        }
        return restaurants;
      });

  Future<RestaurantModel> getRestaurantById({int id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return RestaurantModel.fromSnapshot(doc);
      });

  Future<List<RestaurantModel>> searchRestaurant({String restaurantName}) {
    String searchKey =
        restaurantName[0].toUpperCase() + restaurantName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy('name')
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
          List<RestaurantModel> restaurants = [];
          for (DocumentSnapshot product in result.documents) {
            restaurants.add(RestaurantModel.fromSnapshot(product));
          }
          return restaurants;
        });
  }
}
