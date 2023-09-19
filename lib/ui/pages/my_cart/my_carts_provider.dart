import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/cupertino.dart';


class MyCartsProvider extends ChangeNotifier{
  final RestClient restClient;
  Products? product;
  Map<int, int> cartsMap = {};
  LoadStatus loadStatus = LoadStatus.loading;
  MyCartsProvider(this.restClient);
  void addToCart(int productId, int quantity) async {
    try {
      await singleProduct(productId);
      List<int> allValues = cartsMap.values.toList();
      print(allValues);
      if (cartsMap.containsKey(productId)) {
        cartsMap[productId] = (cartsMap[productId] ?? 0) + quantity;
      } else {
        cartsMap[productId] = quantity;
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  Future<Products?> singleProduct(int productId) async {
    try {
      final data = await restClient.getSingleProduct(productId);
      product = data;
      loadStatus = LoadStatus.success;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}