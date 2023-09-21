import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/cupertino.dart';

class MyCartsProvider extends ChangeNotifier {
  final RestClient restClient;
  Products? product;
  List<Products>? products;
  Map<int, int> cartsMap = {};
  LoadStatus loadStatus = LoadStatus.loading;

  MyCartsProvider(this.restClient);
  void addToCart(int productId, int newQuantity) async {
    try {
      await singleProduct(productId);
      if (cartsMap.containsKey(productId)) {
        if (newQuantity > cartsMap[productId]!) {
          // Nếu newQuantity lớn hơn số lượng hiện tại trong giỏ hàng,
          // thì cộng vào
          cartsMap[productId] = cartsMap[productId]! + newQuantity;
          print(cartsMap[productId]);
        } else if (newQuantity < cartsMap[productId]!) {
          // Nếu newQuantity nhỏ hơn số lượng hiện tại trong giỏ hàng,
          // thì trừ đi
          cartsMap[productId] = cartsMap[productId]! - newQuantity;
          print(cartsMap[productId]);
        }
      } else {
        cartsMap[productId] = newQuantity;
      }
      loadStatus = LoadStatus.success;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  Future<Products?> singleProduct(int productId) async {
    try {
      final data = await restClient.getSingleProduct(productId);
      product = data;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}