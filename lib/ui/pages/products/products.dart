import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/products/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatefulWidget {
  String? categoryName;

  ProductsScreen({super.key, this.categoryName});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductsProvider provider;

  @override
  void initState() {
    provider = context.read<ProductsProvider>();
    // TODO: implement initState
    super.initState();
  //  provider.init(widget.categoryName);
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => provider.getProducts(widget.categoryName ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                )
              ],
            ),
            Expanded(
              child: Consumer<ProductsProvider>(
                  builder: (context, product, child) {
                if (product.loadStatus == LoadStatus.success) {
                  return GestureDetector(
                    onTap: () {},
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 2,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: product.products?.length,
                      itemBuilder: (context, index) {
                        final pro = product.products?[index];
                        return Column(
                          children: [
                            Text(pro?.category ?? '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            Stack(
                              children: [
                                Positioned.fill(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(pro?.image ?? '',
                                      fit: BoxFit.cover),
                                )),
                                Positioned(child: Text(pro?.title ?? '')),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
