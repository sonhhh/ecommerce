import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier{
  final RestClient restClient;
  List<Products>? products;
  LoadStatus loadStatus = LoadStatus.initial;
  ProductsProvider(this.restClient, {this.loadStatus = LoadStatus.initial, this.products});
  Future<void> getProducts()  async{
    loadStatus = LoadStatus.loading;
    notifyListeners();
    try{
        final result = await restClient.getListProduct();
        loadStatus = LoadStatus.success;
        setProductsList(result);
    }catch(e){
      print(e);
    }
  }
  void setProductsList(List<Products>? data){
    if(data != null){
      products = data;
    }

    notifyListeners();
  }
}