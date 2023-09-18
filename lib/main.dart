import 'package:ecommerce/API/api_util.dart';
import 'package:ecommerce/ui/pages/auth/sign_in/provider_sign_in.dart';
import 'package:ecommerce/ui/pages/detail/detail_provider.dart';
import 'package:ecommerce/ui/pages/my_cart/my_carts_provider.dart';
import 'package:ecommerce/ui/pages/page_view/cart/carts_provider.dart';
import 'package:ecommerce/ui/pages/page_view/categori_page/categories_provider.dart';
import 'package:ecommerce/ui/pages/products/products_provider.dart';
import 'package:ecommerce/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool showOnboarding = prefs.getBool('ON_BOARDING') ?? true;
  runApp(MyApp(showOnboarding));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;
  const MyApp(this.showOnboarding, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoriesProvider(ApiUtil.apiClient),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(ApiUtil.apiClient),
        ),
        ChangeNotifierProvider(create: (_) => ProviderSignIn(ApiUtil.apiClient)),
        ChangeNotifierProvider(create: (_) => DetailProvider(ApiUtil.apiClient)),
        ChangeNotifierProvider(create: (_)=> CartsProvider(ApiUtil.apiClient)),
        ChangeNotifierProvider(create: (_)=> MyCartsProvider(ApiUtil.apiClient))
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: //Card()));
    //OrderTracking()));
          //BottomBar()));
          Splash(
            showOnboarding: showOnboarding,
          )),
     );


  }
}
