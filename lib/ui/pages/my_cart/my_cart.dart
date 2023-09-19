import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/detail/quantity_selector.dart';
import 'package:ecommerce/ui/pages/my_cart/my_carts_provider.dart';
import 'package:ecommerce/ui/pages/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  int? id;
  int? quantity;

  MyCart({Key? key, this.id, this.quantity}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late MyCartsProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<MyCartsProvider>(context, listen: false);
    provider.addToCart(widget.id ?? 0, widget.quantity ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 110,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 24,
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                    size: 24,
                  ))
            ],
          ),
          const Text('My Cart',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Consumer<MyCartsProvider>(builder: (context, detail, child) {
            if (detail.loadStatus == LoadStatus.success) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: detail.cartsMap.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  final productId = detail.cartsMap.keys.elementAt(index);
                  final quantity = detail.cartsMap[productId];
                  final product = detail.product; // Lấy thông tin của product từ provider
               //   final productInfo = product != null ? detail.cartsMap[product.id] : null;

                  return Container(
                    height: 120,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      //border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(product?.image ?? '',
                              fit: BoxFit.cover,width: 120),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                product?.title ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              product?.category ?? '',
                              style: const TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              "\$${(product?.price ?? 0) * (quantity ?? 0)}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        QuantitySelector(
                          initialValue: quantity ?? 0,
                          onChanged: (newQuantity) {
                            detail.addToCart(productId, newQuantity);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
              // return ListView.separated(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   itemCount: detail.cartsMap.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: 120,
              //         padding: const EdgeInsets.all(8),
              //         decoration: const BoxDecoration(
              //           border: Border(
              //               bottom: BorderSide(width: 1, color: Colors.grey)),
              //         ),
              //         child: Row(
              //           children: [
              //             ClipRRect(
              //               borderRadius: BorderRadius.circular(15),
              //               child: Image.network(data?.image ?? '',
              //                   fit: BoxFit.cover, width: 120),
              //             ),
              //             const SizedBox(
              //               width: 8,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 SizedBox(
              //                   width: 100,
              //                   child: Text(
              //                     data?.title ?? '',
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                     style: const TextStyle(
              //                         color: Colors.black,
              //                         fontSize: 13,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ),
              //                 Text(
              //                   data?.category ?? '',
              //                   style: const TextStyle(
              //                       fontSize: 13, color: Colors.grey),
              //                 ),
              //                 const SizedBox(
              //                   height: 32,
              //                 ),
              //                 Text(
              //                   "\$${data!.price! * widget.quantity!}",
              //                   style: const TextStyle(
              //                       color: Colors.black,
              //                       fontSize: 13,
              //                       fontWeight: FontWeight.bold),
              //                 )
              //               ],
              //             ),
              //             QuantitySelector(
              //               initialValue: widget.quantity ?? 0,
              //               onChanged: (quantity) {
              //                 setState(() {
              //                   widget.quantity = quantity;
              //                 });
              //               },
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //     separatorBuilder: (context, index) {
              //       return const Divider(
              //         color: Colors.grey,
              //         height: 1,
              //       );
              //     },
              //     );
            } else {
              return const SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 1)),
            child: const Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$17',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BagTotal:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Payment();
                },
              ));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(16)),
              child: const Center(
                child: Text('Proceed to Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
