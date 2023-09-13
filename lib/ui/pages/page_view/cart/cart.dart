import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/page_view/cart/button.dart';
import 'package:ecommerce/ui/pages/page_view/cart/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool ongoingActive = true;
  bool completedActive = false;
  late CartsProvider provider;
  int? productId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = context.read<CartsProvider>();
    provider.getCartAll();
    provider.initProductSingle(productId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  const Text(
                    'My Order',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  StatusButton(
                    text: 'Ongoing',
                    isActive: ongoingActive,
                    onPressed: (isActive) {
                      setState(() {
                        ongoingActive = isActive;
                        completedActive = !isActive;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  StatusButton(
                    text: 'Completed',
                    isActive: completedActive,
                    onPressed: (isActive) {
                      setState(() {
                        completedActive = isActive;
                        ongoingActive = !isActive;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Consumer<CartsProvider>(
                builder: (context, productDetail, child) {
                  if (productDetail.loadStatus == LoadStatus.success) {
                    return SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: (productDetail.cartsAll!.length > 0) ? 3 : 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final all = productDetail.cartsAll?[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 4,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: all?.products?.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final pro = all?.products?[index];
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.circular(8),
                                    //   child: Image.network(
                                    //      '', // Đường dẫn hình ảnh của sản phẩm
                                    //     fit: BoxFit.cover,
                                    //     width: 80,
                                    //   ),
                                    // ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${pro?.productId}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const Text(
                                          '',
                                          style: TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                        Text(
                                          'Quality: ${pro?.quantity ?? 0}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Price: ${pro?.quantity ?? 0}', // Giá
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
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
            ],
          ),
        ),
      ),
    );
  }
}
