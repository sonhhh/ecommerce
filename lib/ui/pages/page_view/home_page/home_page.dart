import 'package:ecommerce/model/enum/data_fix.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/detail/detail_products.dart';
import 'package:ecommerce/ui/pages/page_view/account/account.dart';
import 'package:ecommerce/ui/pages/page_view/categori_page/categories_page.dart';
import 'package:ecommerce/ui/pages/page_view/categori_page/categories_provider.dart';
import 'package:ecommerce/ui/pages/products/products.dart';
import 'package:ecommerce/ui/pages/products/products_provider.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  String? categoryName;

  HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late TextEditingController searchController;
  late CategoriesProvider provider;
  late ProductsProvider providerProducts;

  @override
  void initState() {
    // TODO: implement initState
    provider = context.read<CategoriesProvider>();
    providerProducts = context.read<ProductsProvider>();
    searchController = TextEditingController();
    super.initState();
    provider.initData();
    providerProducts.initNew();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.list_alt_rounded,
                    size: 25,
                    color: Colors.black,
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Account();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 25,
                  )),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25)),
                  const Text(
                    'Our Fashions App',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextFieldSearch(
                          controller: searchController, hintText: 'Search'),
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list,
                            size: 20,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    //height: 80,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/introl/introl_1.jpeg',
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Travis Scott',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              'Rapper',
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                            ),
                            Text(
                              "100000000000",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_circle_right,
                              color: Colors.black,
                              size: 35,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: Consumer<CategoriesProvider>(
                      builder: (context, categorise, child) {
                        if (categorise.loadStatus == LoadStatus.success) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: categorise.categories?.length,
                            itemBuilder: (context, index) {
                              final isSelected =
                                  index == categorise.selectedCategoryIndex;
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      categorise.setIndex(index);
                                    },
                                    child: Container(
                                      width: 150,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                      child: Center(
                                        child: Text(
                                          categorise.categories?[index] ?? '',
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return const SizedBox(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Consumer<CategoriesProvider>(
                        builder: (context, categori, child) {
                      if (categori.loadStatus == LoadStatus.success) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Top ${categori.selectedCategoryName ?? ''}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              child: const Text(
                                'View All',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ProductsScreen(
                                      categoryName:
                                          categori.selectedCategoryName,
                                    );
                                  },
                                ));
                              },
                            )
                          ],
                        );
                      } else {
                        return const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }),
                  ),
                  SizedBox(
                    height: 500,
                    child: Consumer<CategoriesProvider>(
                      builder: (context, product, child) {
                        if (product.loadStatus == LoadStatus.success) {
                          return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 250,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  (product.products?.length ?? 0) > 4 ? 4 : 4,
                              itemBuilder: (context, index) {
                                final pro = product.products?[index];
                                if (product.selectedCategoryName ==
                                    pro?.category) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Detail(
                                            title: pro?.title,
                                            image: pro?.image,
                                            description: pro?.description,
                                            price: pro?.price,
                                            category: pro?.category,
                                            id: pro?.id,
                                          );
                                        },
                                      ));
                                    },
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.network(
                                                  pro?.image ?? '',
                                                  fit: BoxFit.cover,
                                                  height: 170,
                                                  width: 180,
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                                height: 28,
                                                right: 12,
                                                top: 12,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.black,
                                                  child: Icon(
                                                      Icons
                                                          .favorite_outline_rounded,
                                                      color: Colors.white,
                                                      size: 16),
                                                ))
                                          ],
                                        ),
                                        Text(
                                          pro?.title ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          '\$${pro?.price}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              });
                        } else {
                          return const Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      itemExtent: 250,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    categories[index].image ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                left: 20,
                                top: 30,
                                child: Text(
                                  '50% Off',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                )),
                            const Positioned(
                                top: 60,
                                left: 20,
                                child: Text(
                                  'On everthinh today',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                )),
                            const Positioned(
                                top: 90,
                                left: 20,
                                child: Text(
                                  'With code: GDSHFDSK',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                )),
                            Positioned(
                                bottom: 20,
                                left: 30,
                                child: Container(
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text("Get Now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ))
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<ProductsProvider>(
                    builder: (context, product, child) {
                      if (product.loadStatus == LoadStatus.success) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'New Arrivals',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                GestureDetector(
                                  child: const Text(
                                    'View All',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return Scaffold(
                                          appBar: AppBar(),
                                          body: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisExtent: 250,
                                                    mainAxisSpacing: 10,
                                                    crossAxisSpacing: 10,
                                                  ),
                                                  // scrollDirection: Axis.vertical,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: (product
                                                          .products?.length ??
                                                      0),
                                                  itemBuilder:
                                                      (context, index) {
                                                    final arr = product
                                                        .products?[index];
                                                    return GestureDetector(
                                                      child: Column(
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Positioned(
                                                                  child:
                                                                      ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            20)),
                                                                child: Image
                                                                    .network(
                                                                  arr?.image ??
                                                                      '',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  height: 170,
                                                                  width: 180,
                                                                ),
                                                              )),
                                                            ],
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              arr?.title ?? '',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Text(
                                                            '\$${arr?.price}',
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ));
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 210,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                // scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    (product.products?.length ?? 0) > 2 ? 2 : 2,
                                itemBuilder: (context, index) {
                                  final arr = product.products?[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Detail(
                                            title: arr?.title,
                                            image: arr?.image,
                                            category: arr?.category,
                                            description: arr?.description,
                                            price: arr?.price,
                                          );
                                        },
                                      ));
                                    },
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Positioned(
                                                child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              child: Image.network(
                                                arr?.image ?? '',
                                                fit: BoxFit.cover,
                                                height: 170,
                                                width: 180,
                                              ),
                                            )),
                                          ],
                                        ),
                                        Center(
                                          child: Text(
                                            arr?.title ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          '\$${arr?.price}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                  ListView.builder(
                    itemExtent: 90,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 85,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 1,
                              offset:
                              const Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                detail[index].image ?? '',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 120,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  detail[index].name ?? '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  detail[index].categories ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                const Text(
                                  '4.8',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              detail[index].price ?? '',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ]),
          ),
        ));
  }
}
