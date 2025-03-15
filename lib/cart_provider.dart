import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> productL = [];
  void addProduct(Map<String, dynamic> productD) {
    productL.add(productD);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> productD) {
    productL.remove(productD);
    notifyListeners();
  }
}
