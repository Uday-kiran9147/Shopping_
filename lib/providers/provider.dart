import 'package:flutter/material.dart';
import 'package:shopping_ui/models/product.dart';
import 'package:shopping_ui/services/apiservices.dart';

class AppProvider with ChangeNotifier {
  List<ProductModel>? _products = [];
  List<ProductModel>? get products => _products!;
  List<String> _categories = [];
  List<String> get categories => _categories;

  Future<void> getCategories() async {
    await ApiService().getCategories().then((categorylist) {
      _categories = categorylist;
      notifyListeners();
    });
  }

  Future<void> getProducts() async {
    await ApiService().getProducts().then((productlist) {
      _products = productlist!;
      notifyListeners();
    });
  }
}
