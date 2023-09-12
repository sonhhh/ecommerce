import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/carts_all.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/foundation.dart';

class CartsProvider extends ChangeNotifier {
  final RestClient restClient;
  List<CartsAll>? cartsAll;
  LoadStatus loadStatus = LoadStatus.loading;

  CartsProvider(this.restClient, {this.loadStatus = LoadStatus.loading});

  Future<List<CartsAll>?> getAll() async {
    try {
      final results = await restClient.getCartsAll();
      cartsAll = results;
      loadStatus = LoadStatus.success;
    } catch (e) {
      print(e);
      loadStatus = LoadStatus.failure;
    }
    notifyListeners();
  }
}
