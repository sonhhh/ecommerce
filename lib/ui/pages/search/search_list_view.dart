import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/page_view/categori_page/home_provider.dart';

import 'package:ecommerce/ui/pages/products/products.dart';
import 'package:ecommerce/ui/pages/widget/text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({super.key});

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  late TextEditingController searchController;
  late HomeProvider provider;

  @override
  void initState() {
    provider = context.read<HomeProvider>();
    super.initState();
    searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => provider.initData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.format_list_bulleted,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextFieldSearch(
              controller: searchController,
              hintText: 'Search Categories',
            ),
            //const SizedBox(height: 30),
            Expanded(
              child: Consumer<HomeProvider>(
                builder: (context, provider, child) {
                  if (provider.loadStatus == LoadStatus.success) {
                    return SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: provider.categories?.length,
                          itemBuilder: (context, index) {
                            //final categories = provider.categories?[index];
                            if (index < 6) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return ProductsScreen(
                                      //id: categories?.id,
                                    );
                                  },));
                                },
                                child: Container(
                                  height: 100,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(
                                         '', //  categories?.image ?? '',
                                            fit: BoxFit.cover,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width: 350,
                                          height: 40,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Center(
                                            child: Text(
                                             '', //categories?.name ?? '',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                    );
                  } else {
                    return const SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
