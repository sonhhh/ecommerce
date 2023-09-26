import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/carts.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/cupertino.dart';

class MyCartsProvider extends ChangeNotifier {
  final RestClient restClient;
  Product? product;
  Map<int, int> cartsMap = {};
  LoadStatus loadStatus = LoadStatus.loading;

  MyCartsProvider(this.restClient);
  void removeFromCart(int productId, int quantity) {
    if (cartsMap.containsKey(productId)) {
      cartsMap[productId] = cartsMap[productId]! - quantity;
      if (cartsMap[productId]! <= 0) {
        if (cartsMap[productId]! < 0) {
          cartsMap[productId] = 0;
          cartsMap.remove(productId);
        } else {
        }
      }
    }
    notifyListeners();
  }
}