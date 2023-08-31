import 'package:ecommerce/model/enum/data_fix.dart';
import 'package:ecommerce/ui/pages/bottom_navigation_bar/bottom_bar.dart';
import 'package:ecommerce/ui/pages/page_view/cart/button.dart';
import 'package:ecommerce/ui/pages/page_view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Cart extends StatefulWidget {

  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool ongoingActive = true;
  bool completedActive = false;


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
              height: 40,
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                )),
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
            SizedBox(
              width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: cart.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cart[index].image ?? '',
                            fit: BoxFit.cover,
                            width: 80,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cart[index].nameProduct ?? '',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(cart[index].cate ?? '',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                            Text('Quality: ${cart[index].quan}'),
                            Text('Size: ${cart[index].size}'),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '${cart[index].price}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
