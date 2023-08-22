import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_categories/categories.dart';
import 'package:retrofit/retrofit.dart';

part 'api_categories.g.dart';

@RestApi(baseUrl: "https://api.escuelajs.co/api")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/v1/categories')
    Future<List<Categories>> categories();
}