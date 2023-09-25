
import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/carts.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/cupertino.dart';
class DetailProvider extends ChangeNotifier {
  final RestClient restClient;
  Carts? carts;
  Products? product;
  Map<int, int> cartsMap = {};
  int? quantityUpdate;
  LoadStatus loadStatus = LoadStatus.loading;
  DetailProvider(this.restClient);
  void setCart(Carts data) {
    carts = data;
  }

  Future<Carts?> postCart() async {
    if (carts != null) {
      try {
        final response = await restClient.postCart(carts!);
        if (response != null) {
          int id = carts?.products?[0].productId ?? 0;
          print(id);
          print('success');
        } else {
          print("faile");
        }
      } catch (e) {
        print('Đã có lỗi xảy ra: $e');
      }
    } else {
      print('ko co');
    }
  }

  Future<void> updateQuantity(int id, Carts carts) async {
    try {
      final updateQuantity = await restClient.updateCart(id, carts);
      if (updateQuantity != null) {
        print('Cập nhật thành công');
        quantityUpdate = carts.products?[0].quantity;
      } else {
        print('Cập nhật thất bại');
      }
      notifyListeners();
    } catch (e) {
      print('Đã có lỗi xảy ra: $e');
    }
  }
  void addToCart(int productId, int newQuantity) async {
    try {
      await singleProduct(productId);
      if (cartsMap.containsKey(productId)) {
        cartsMap[productId] = (cartsMap[productId] ?? 0) + newQuantity;
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
