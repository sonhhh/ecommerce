import 'package:ecommerce/API/api_util.dart';
import 'package:ecommerce/ui/pages/detail/detail_products.dart';
import 'package:ecommerce/ui/pages/page_view/categori_page/home_provider.dart';

import 'package:ecommerce/ui/pages/products/products_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(ApiUtil.apiClient),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(ApiUtil.apiClient),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Detail()),
    );
  }
}
