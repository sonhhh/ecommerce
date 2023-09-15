import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/carts_all.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/foundation.dart';

class CartsProvider extends ChangeNotifier {
  final RestClient restClient;
  List<CartsAll>? cartsAll;
  List<Products>? allProducts;
  LoadStatus loadStatus = LoadStatus.loading;
  CartsProvider(this.restClient, {this.loadStatus = LoadStatus.loading});
  Future<void> initAllProduct() async {
    try {
      final productsAll = await restClient.getAllProducts();
      allProducts = productsAll;
      print(allProducts);
      loadStatus = LoadStatus.success;
    } catch (e) {
      print(e);
      loadStatus = LoadStatus.failure;
    }
    notifyListeners();
  }
  Future<void> getCartAll() async {
    try {
      final results = await restClient.getCartsAll();
      cartsAll = results;
      if (cartsAll != null && allProducts != null) {
        for (var cart in cartsAll!) {
          List<Product>? products = cart.products;
          if (products != null) {
            for (var product in products) {
              int? productId = product.productId;
              if (productId != null) {
                // Tìm sản phẩm tương ứng với productId
                List<Products> matchedProducts = allProducts!.where((p) => p.id == productId).toList();
                print(matchedProducts);
              }
            }
          }
        }
      }
      loadStatus = LoadStatus.success;
    } catch (e) {
      print(e);
      loadStatus = LoadStatus.failure;
    }
    notifyListeners();
  }
  void deleteProduct(int productId){
  try{
    var productToDelete = allProducts!.firstWhere((product) => product.id == productId);
    if (productToDelete != null) {
      // Xoá sản phẩm khỏi danh sách
      allProducts!.remove(productToDelete);
    } else {
      print('Không tìm thấy sản phẩm có ID: $productId');
    }
  }catch(e){
    print(e);
  }
  notifyListeners();
  }
}
