import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_ui/models/product.dart';


class ApiService {
  Future<List<String>> getCategories() async {
    var url = Uri.parse('https://fakestoreapi.com/products/categories');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var datalist = jsonDecode(response.body) as List;
      List<String> categories = [];
      for (var data in datalist) {
        categories.add(data);
      }
      return categories;
    }
    return [];
  }

  Future<List<ProductModel>?> getProducts() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print("Status Code: ${response.statusCode}");
      var datalist = jsonDecode(response.body) as List; // we get list of maps
      List<ProductModel> products = [];
      for (var data in datalist) {
        ProductModel newProduct = ProductModel.fromMap(data
            as Map<String, dynamic>); // we convert each map to ProductModel
        products.add(newProduct);
      }
      return products;
    } else {
      // Request failed, print status code
      print(response.statusCode);
      return [];
    }
  }

  Future getProductsByCategory(String category) async {
    var url = Uri.parse('https://fakestoreapi.com/products/category/$category');
    var response = await http.get(url);
    return response;
  }

  Future getProductsById(int id) async {
    var url = Uri.parse('https://fakestoreapi.com/products/$id');
    var response = await http.get(url);
    return response;
  }

  Future getProductsBySearch(String query) async {
    var url = Uri.parse('https://fakestoreapi.com/products?title=$query');
    var response = await http.get(url);
    return response;
  }
}
