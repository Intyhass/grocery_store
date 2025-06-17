import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items
  final List _shopItems = [
    ['Avocado', '40.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '10.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '300.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '35.00', 'assets/images/water.png', Colors.blue],
  ];
  //list of cart
  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  //add item
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
