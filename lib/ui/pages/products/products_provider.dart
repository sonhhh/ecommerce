import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  final RestClient restClient;
  List<Products>? products;
  String? categoryName;
  LoadStatus loadStatus = LoadStatus.loading;
  ProductsProvider(this.restClient,
      {this.loadStatus = LoadStatus.loading, this.products});

  void initProduct(String? category) async {
    try {
      final r = await getProductsByCategory(category ?? '');
      setProductsList(r);
      loadStatus = LoadStatus.success;
    } catch (e, s) {
      print(e);
      print(s);
      loadStatus = LoadStatus.failure;
    }
    notifyListeners();
  }

  void initNew() async {
    try {
      final h = await getProducts();
      products = h;
      print(products);
      if ( (products ?? []).isNotEmpty){
        setProductsList(h);
        loadStatus = LoadStatus.success;
      }
    } catch (e) {
      loadStatus = LoadStatus.failure;
    }
    notifyListeners();
  }

  Future<List<Products>?> getProducts() async {
    try {
      final results = await restClient.getProducts();
      return results;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Products>?> getProductsByCategory(String name) async {
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
  }
}
