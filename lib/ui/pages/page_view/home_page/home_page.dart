import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_categories/api_categories.dart';
import 'package:ecommerce/API/api_categories/categories.dart';
import 'package:ecommerce/API/api_util.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/page_view/home_page/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<HomeProvider>();
    provider.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
            onPressed: () {},
              icon: const Icon(  Icons.search,
                color: Colors.black,
                size: 30,),
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
                  child: Consumer<HomeProvider>(
                    builder: (_, provider, child) {
                      if (provider.loadStatus == LoadStatus.success) {
                        return ListView.builder(
                          itemCount: provider.categories?.length ?? 8,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            if (index < 6) {
                              final category = provider.categories?[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                height: 80,
                                margin: const EdgeInsets.all(5),
                                decoration:  BoxDecoration(color: Colors.black,
                                borderRadius: BorderRadius.circular(35),
                                ),
                                child: Row(
                                 // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.account_balance, color: Colors.white, size: 15),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(category?.name ?? '', style: const TextStyle(color: Colors.white, fontSize: 15)),
                                    const Spacer(),
                                    const Text("150", style: TextStyle(fontSize: 15, color: Colors.white),)
                                  ],
                                ),
                              );
                            }
                          }
                        );
                      } else {
                        return const CircularProgressIndicator();
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
