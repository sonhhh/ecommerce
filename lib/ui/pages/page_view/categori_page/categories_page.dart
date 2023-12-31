import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/page_view/categori_page/categories_provider.dart';
import 'package:ecommerce/ui/pages/products/products.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CategoriesProvider provider;

  @override
  void initState() {
    provider = context.read<CategoriesProvider>();
    super.initState();
    provider.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            )
          ],
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
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
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Consumer<CategoriesProvider>(
                    builder: (_, provider, child) {
                      if (provider.loadStatus == LoadStatus.success) {
                        return ListView.builder(
                            itemCount: provider.categories?.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              if (index < 4) {
                                final category = provider.categories?[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ProductsScreen(
                                          categoryName: category,
                                        );
                                      },
                                    ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    width: double.infinity,
                                    height: 80,
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.account_balance,
                                            color: Colors.white, size: 15),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(category ?? '',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                        const Spacer(),
                                        const Text(
                                          "150",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }
                            });
                      } else {
                        return Center(
                          child:  SizedBox(
                              height: 50.h,
                              width: 50.h,
                              child: const CircularProgressIndicator()),
                        );
                      }
                    },
                    child: const SizedBox(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
