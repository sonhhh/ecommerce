import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/detail/detail_products.dart';
import 'package:ecommerce/ui/pages/products/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


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
    super.initState();
    provider.initProduct(widget.categoryName ?? '');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 1.h,
        width: 1.w,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 25.sp,
                    )),
                 Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25.sp,
                ),
              ],
            ),
            Text(widget.categoryName ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.sp)),
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
                        mainAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: product.products?.length,
                      itemBuilder: (context, index) {
                        final pro = product.products?[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Detail(
                                  id: pro?.id,
                                  category: pro?.category,
                                  title: pro?.title,
                                  price: pro?.price,
                                  image: pro?.image,
                                  description: pro?.description,
                                );
                              },
                            ));
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 120.h,
                                  child: Image.network(
                                    pro?.image ?? '',
                                    fit: BoxFit.cover,
                                  )),
                              Text(
                                pro?.category ?? '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                pro?.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey),
                              ),
                              Text(
                                '\$${pro?.price ?? ''}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: SizedBox(
                      height: 50.h,
                      width: 50.h,
                      child: const CircularProgressIndicator(),
                    ),
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
