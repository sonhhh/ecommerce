import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  final RestClient restClient;
  List<Products>? products;
  String? categoryName;
  LoadStatus loadStatus = LoadStatus.initial;

  ProductsProvider(this.restClient,
      {this.loadStatus = LoadStatus.initial, this.products});

  void init(String? category) async {
    loadStatus = LoadStatus.loading;
    notifyListeners();
    final r = await getProducts(categoryName ?? '');
    setProductsList(r);
    notifyListeners();
  }

  Future<List<Products>?> getProducts(String name) async {
    try {
      final result = await restClient.getProductsByCategory(name);
      return result;
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  void setProductsList(List<Products>? data) {
    if (data != null) {
      products = data;
      loadStatus = LoadStatus.success;
    }
    notifyListeners();
  }
}
