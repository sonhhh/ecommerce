import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_util.dart';
import 'package:ecommerce/ui/pages/bottom_navigation_bar/bottom_bar.dart';
import 'package:ecommerce/ui/pages/page_view/home_page/home_page.dart';
import 'package:ecommerce/ui/pages/page_view/home_page/home_provider.dart';
import 'package:ecommerce/ui/pages/search/search_gridview.dart';
import 'package:ecommerce/ui/pages/search/search_list_view.dart';
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
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SearchListView()),
    );
  }
}
