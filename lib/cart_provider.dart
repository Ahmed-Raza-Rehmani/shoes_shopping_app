import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> productL = [];

  void addProduct(Map<String, dynamic> productM) {
    productL.add(productM);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> productM) {
    productL.remove(productM);
    notifyListeners();
  }
}
