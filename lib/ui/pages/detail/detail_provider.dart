import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/carts.dart';
import 'package:flutter/cupertino.dart';

class DetailProvider extends ChangeNotifier{
  final RestClient restClient;
  Carts? cart;
  DetailProvider(this.restClient);

  Future<Carts?> postCart(Carts carts) async {
    try {
      final response = await restClient.getAllCart(carts);
      notifyListeners();
      return response;
    } catch (e) {
      print('Đã có lỗi xảy ra: $e');
    }
  }
}