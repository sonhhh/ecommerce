import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider with ChangeNotifier {
  final RestClient restClient;
  List<String>? categories;
  List<Products>? products;
  LoadStatus loadStatus = LoadStatus.loading;
  String? selectedCategoryName;
  CategoriesProvider(this.restClient,
      {this.loadStatus = LoadStatus.loading, this.categories});
  int selectedCategoryIndex = 0  ;
  Future<void> initData() async {
    try {
      final result = await restClient.getListCategory();
      categories = result;
      if (result != null) {
        final selectedCategory = categories![selectedCategoryIndex];
        final products = await restClient.getProductsByCategory(
            selectedCategory);
        if (products != null) {
          this.products = products;
          loadStatus = LoadStatus.success;
        } else {
          loadStatus = LoadStatus.failure;
        }
        selectedCategoryName = selectedCategory; // Thay đổi thành selectedCategory
      } else {
        loadStatus = LoadStatus.failure;
      }
      notifyListeners();
    } catch (e) {
      loadStatus = LoadStatus.failure;
      notifyListeners();
    }
  }

  void setIndex(int index){
    if (index >= 0 && index < categories!.length) {
      selectedCategoryIndex = index;
      selectedCategoryName = categories![index];
      notifyListeners();
    }
  }
}
