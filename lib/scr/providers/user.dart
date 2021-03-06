import 'package:app_food/scr/helpers/user.dart';
import 'package:app_food/scr/models/products.dart';
import 'package:app_food/scr/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  Status get status => _status;
  UserModel get userModel => _userModel;
  FirebaseUser get user => _user;

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChange);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((results) {
        _firestore.collection('users').document(results.user.uid).setData({
          'name': name.text,
          'email': email.text,
          'uid': results.user.uid,
          'likedFood': [],
          'likedRestaurants': []
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<void> _onStateChange(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

  // gernernal methods
  // bool _onError(String error) {
  //   _status = Status.Unauthenticated;
  //   notifyListeners();
  //   print('We get an error: $error');
  //   return false;
  // }

  void clearController() {
    email.text = '';
    password.text = '';
    name.text = '';
  }

  Future addToCart({ProductModel product, int quantity}) async {
    print('The product is: ${product.toString()}');
    print('The product is: ${quantity.toString()}');
    // try {
    var uuid = Uuid();
    String cartItemId = uuid.v4();
    List cart = _userModel.cart;
    bool itemExits = false;
    Map cartItem = {
      'id': cartItemId,
      'name': product.name,
      'image': product.image,
      'productId': product.id,
      'price': product.price,
      'quantity': quantity
    };

    for (Map item in cart) {
      if (item['productId'] == cartItem['productId']) {
        item['quantity'] = item['quantity'] + quantity;
        itemExits = true;
        break;
      }
    }

    if (!itemExits) {
      _userModel.cart.add(cartItem);
    }
    print('cart item are: ${cart.toString()}');

    _userServices.editCart(userId: _userModel.id, cart: _userModel.cart);
    return true;
    // } catch (e) {
    //   print('the error: ${e.toString()}');
    //   return false;
    // }
  }
}
