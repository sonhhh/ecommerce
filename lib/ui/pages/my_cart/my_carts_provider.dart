import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:flutter/cupertino.dart';

class MyCartsProvider extends ChangeNotifier{
  final RestClient restClient;
  Products? product;
  Map<int, int> cartsMap = {};
  MyCartsProvider(this.restClient);
  void addToCart(int productId, int quantity) {
    cartsMap[productId] = quantity;
    if (cartsMap.containsKey(productId)) {
      cartsMap[productId] = (cartsMap[productId] ?? 0) + quantity;
      cartsMap[productId] = quantity;
    }
    notifyListeners();
  }
  Future<Products?> singleProduct(int productId) async {
    try {
      final data = await restClient.getSingleProduct(productId);
      return data;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

}