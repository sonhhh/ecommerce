import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/carts.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:flutter/cupertino.dart';

class DetailProvider extends ChangeNotifier{
  final RestClient restClient;
  Carts? carts;
  List<Carts>? addCarts;
  Products? product;
  DetailProvider(this.restClient);
  void setCart(Carts data){
    carts = data ;
  }
  Future<Carts?> postCart() async {
    if(carts != null) {
      try {
          final response = await restClient.postCart(carts!);
        if (response != null) {
          int id = carts?.products?[0].productId ?? 0;
          print(id);
          addCarts =[response];
          await SingleProduct(id);
          print('success');
        } else {
          print("faile");
        }
      } catch (e) {
        print('Đã có lỗi xảy ra: $e');
      }
    }else{
      print('ko co');
    }
  }
  Future<void> updateQuantity(int id, Carts carts) async {
    try {
      final updateQuantity = await restClient.updateCart( id, carts);
      if (updateQuantity != null) {
        print('Cập nhật thành công');
      } else {
        print('Cập nhật thất bại');
      }
    } catch (e) {
      print('Đã có lỗi xảy ra: $e');
    }
  }
Future<Products?> SingleProduct(int productId) async{
    try{
      final data = await restClient.getSingleProduct(productId);
      product = data;
      print(product);
    }catch(e){
      print(e);
    }
}
  }