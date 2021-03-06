import 'package:app_food/scr/models/cart_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const ID = 'id';
  static const STRIPE_ID = 'stripe_id';
  static const CART = 'cart';

  String _name;
  String _email;
  String _id;
  String _stripeId;

  List cart;

//getter
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get stripeId => _stripeId;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _stripeId = snapshot.data[STRIPE_ID];
    cart = snapshot.data[CART] ?? [];
  }

  // List<CartItemModel> _convertCartItems(List<Map> cart) {
  //   List<CartItemModel> convertedCart = [];
  //   for (Map cartItem in cart) {
  //     convertedCart.add(CartItemModel.fromMap(cartItem));
  //   }
  //   return convertedCart;
  // }
}
