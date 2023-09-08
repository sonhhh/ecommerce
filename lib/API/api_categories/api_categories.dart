import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:retrofit/retrofit.dart';

part 'api_categories.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('products/categories')
    Future<List<String>> getListCategory();
  @GET('/products/category/{name}')
  Future<List<Products>> getProductsByCategory(@Path('name') String name);
  @GET('/products')
  Future<List<Products>> getProducts({
    @Query('limit') String limit = '5',
  });
}