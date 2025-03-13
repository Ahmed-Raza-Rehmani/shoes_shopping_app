import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> productL = [];

  void addProduct(Map<String, dynamic> productV) {
    productL.add(productV);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> productV) {
    productL.remove(productV);
    notifyListeners();
  }
}
