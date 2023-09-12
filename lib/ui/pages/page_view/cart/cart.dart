import 'package:ecommerce/model/enum/data_fix.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = context.read<CartsProvider>();
    provider.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
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
            SingleChildScrollView(
              child: Consumer<CartsProvider>(
                builder: (context, carts, child) {
                  if (carts.loadStatus == LoadStatus.success) {
                    return SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: (carts.cartsAll!.length > 0) ? 3 : 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final all = carts.cartsAll?[index];
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
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(8),
                                //   child: Image.network(
                                //     '',
                                //     fit: BoxFit.cover,
                                //     width: 80,
                                //   ),
                                // ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text('',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey)),
                                    Text('Quality: '),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(child: CircularProgressIndicator()));
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
