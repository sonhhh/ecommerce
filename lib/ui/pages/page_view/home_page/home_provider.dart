
import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/categories.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  final RestClient restClient;
  List<Categories>? categories;
  LoadStatus loadStatus = LoadStatus.initial;

  HomeProvider(this.restClient, {this.loadStatus = LoadStatus.initial, this.categories});

  // init data
  Future<void> initData() async {
    loadStatus = LoadStatus.loading;
    notifyListeners();
    try {
      final result = await restClient.getListCategory();
      categories = result;
      loadStatus = LoadStatus.success;
      notifyListeners();
    } catch (e) {
      loadStatus = LoadStatus.failure;
      notifyListeners();
    }
  }
}
