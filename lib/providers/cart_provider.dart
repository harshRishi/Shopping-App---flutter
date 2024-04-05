import 'package:flutter/material.dart';

// extend it with ChangeNotifer to use as ChangeNotifierProvider
class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(product) {
    cart.add(product);
    notifyListeners(); // listen to changes - privided by  ChangeNotifier
  }

  void removeProduct(product) {
    cart.remove(product);
    notifyListeners(); // listen to changes - privided by  ChangeNotifier
  }
}
