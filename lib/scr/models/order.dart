import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const DESCRIPTION = 'description';
  static const ID = 'id';
  static const PRODUCT_ID = 'productId';
  static const AMOUNT = 'amount';
  static const STATUS = 'status';
  static const USER_ID = 'userId';
  static const CREATED_AT = 'createdAt';

  String _id;
  String _description;
  String _productId;
  int _amount;
  String _status;
  String _userId;
  int _createdAt;

  String get id => _id;
  String get description => _description;
  String get productId => _productId;
  int get amount => _amount;
  String get status => _status;
  String get userId => _userId;
  int get createdAt => _createdAt;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _description = snapshot.data[DESCRIPTION];
    _productId = snapshot.data[PRODUCT_ID];
    _amount = snapshot.data[AMOUNT];
    _status = snapshot.data[STATUS];
    _createdAt = snapshot.data[CREATED_AT];
    _userId = snapshot.data[USER_ID];
  }
}
