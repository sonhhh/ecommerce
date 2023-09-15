import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/page_view/cart/button.dart';
import 'package:ecommerce/ui/pages/page_view/cart/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    super.initState();
    provider = context.read<CartsProvider>();
    provider.initAllProduct();
    provider.getCartAll();
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
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 12,
                          );
                        },
                        padding: EdgeInsets.zero,
                        itemCount: productDetail.allProducts?.length ?? 0,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final all = productDetail.allProducts?[index];
                          return Slidable(
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              extentRatio: 1,
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    provider.deleteProduct(all?.id ?? 0);
                                  },
                                  backgroundColor: Colors.black,
                                  icon: Icons.delete,
                                  foregroundColor: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                )
                              ],
                            ),
                            child: Container(
                              height: 120,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.black, width: 1),
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
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(all?.image ?? '',width: 80,
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 160,
                                        child: Text(
                                          all?.title ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        all?.category ?? '',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Text(
                                          'Quantity: ${all?.id}')
                                    ],
                                  ),
                                  Text(
                                    '\$${(all?.price)?.toStringAsFixed(1)}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
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
