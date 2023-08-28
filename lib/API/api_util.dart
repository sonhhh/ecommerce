import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiUtil {
  static Dio? dio;

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = const Duration(milliseconds: 6000000);
      dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        compact: false,
      ));
    }
    return dio!;
  }

  static RestClient get apiClient {
    final apiClient =
        RestClient(getDio(), baseUrl: "https://fakestoreapi.com/");
    return apiClient;
  }
}
