import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/categories.dart';
import 'package:ecommerce/ui/pages/page_view/home_page/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final restClient = RestClient(dio);
    final homeProvider = HomeProvider(restClient);

    return ChangeNotifierProvider(
      create: (context) => homeProvider,
      child: const HomePageChild(),
    );
  }
}


class HomePageChild extends StatefulWidget {
  const HomePageChild({super.key});

  @override
  State<HomePageChild> createState() => _HomePageChildState();
}

class _HomePageChildState extends State<HomePageChild> {
   late HomeProvider provider;
  late TextEditingController searchController;
  Categories categories = Categories();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
      provider = Provider.of<HomeProvider>(context, listen: false);
      provider.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  ListView.builder(
                    itemCount: homeProvider.categories?.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                    return Container();
                  },)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

