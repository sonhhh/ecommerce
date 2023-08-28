import 'package:ecommerce/model/enum/load_status.dart';

import 'package:ecommerce/ui/pages/products/products.dart';
import 'package:ecommerce/ui/pages/products/products_provider.dart';
import 'package:ecommerce/ui/pages/widget/text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController searchController;
  late ProductsProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    provider = context.read<ProductsProvider>();
    super.initState();
    searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => provider.getProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.grid_view,
                  size: 20,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(height: 20,),
            AppTextFieldSearch(
                controller: searchController, hintText: 'Search Categories'),
           // const SizedBox(height: 30),
            Expanded(
              child: Consumer<ProductsProvider>(
                builder: (context, provider, child) {
                  if (provider.loadStatus == LoadStatus.success) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 200,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: provider.products?.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < 6) {
                          final pro = provider.products?[index];
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) {
                                  return ProductsScreen(
                                    name: pro?.category,
                                  );
                                },));
                              },
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        pro?.image ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.4),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            )),
                                        width: 180,
                                        height: 40,
                                        child: Center(
                                            child: Text(
                                              pro?.category ?? '',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return const SizedBox(
                      height: 50,
                        width: 50,
                        child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
