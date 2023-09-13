import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/carts_all.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/foundation.dart';

class CartsProvider extends ChangeNotifier {
  final RestClient restClient;
  List<CartsAll>? cartsAll;
  Products? products;
  LoadStatus loadStatus = LoadStatus.loading;
  CartsProvider(this.restClient, {this.loadStatus = LoadStatus.loading});
  Future<Products?> initProductSingle(int productId) async{
    try{
        final productSingle = await restClient.getSingleProduct(productId);
          print(productSingle);
          loadStatus = LoadStatus.success;
    }catch(e){
      print(e);
    }
    notifyListeners();
  }
  Future<List<CartsAll>?> getCartAll() async {
    try {
      final results = await restClient.getCartsAll();
      cartsAll = results;
      if (cartsAll != null) {
        for (var cart in cartsAll!) {
          List<Product>? products = cart.products;
          if (products != null) {
            for (var product in products) {
              int? productId = product.productId;
              if (productId != null) {
                await initProductSingle(productId);
              }
            }
          }
        }
      }
    } catch (e) {
      print(e);
      loadStatus = LoadStatus.failure;
    }
    notifyListeners();
  }
}
