import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_ui/services/apiservices.dart';

void main() {
  group("API Testing on products and categories ", () {
    test("Get products from products list ", () async {
      final productslist = await ApiService().getProducts();

      expect(productslist!.length, 20); // we expect 20 products
    });

    test("Get categories from categories list ", () async {
      final categorieslist = await ApiService().getCategories();

      expect(categorieslist.length, 4); // we expect 5 categories
    });
  });
}
