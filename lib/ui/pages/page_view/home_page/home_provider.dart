import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/categories.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  final RestClient restClient;
  List<Categories>? categories ;
  HomeProvider(this.restClient);
  Future<void> fetchCategories() async{
    if (categories != null) {
      final response = await restClient.categories();
      categories = response;
      notifyListeners();
    }
  }
}