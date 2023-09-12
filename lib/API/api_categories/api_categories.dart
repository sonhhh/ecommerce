import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_categories/carts.dart';
import 'package:ecommerce/API/api_categories/carts_all.dart';
import 'package:ecommerce/API/api_categories/products.dart';
import 'package:ecommerce/API/api_categories/user.dart';
import 'package:retrofit/retrofit.dart';

import '../../ui/pages/page_view/cart/cart.dart';

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
  @POST('/auth/login')
  Future<User> getLogin(
      @Field('username') String username,
      @Field('password') String password,
      );
  @POST('/carts')
  Future<Carts> getAllCart(
      @Body() Carts carts
      );
  @GET('/carts')
  Future<List<CartsAll>> getCartsAll();
}