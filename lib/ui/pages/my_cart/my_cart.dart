import 'package:ecommerce/model/enum/data_fix.dart';
import 'package:ecommerce/ui/pages/detail/quantity_selector.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCart extends StatefulWidget {
  final String? category;
  final String? title;
  final double? price;
  final String? image;
  int? quantity;

  MyCart(
      {Key? key,
      this.category,
      this.title,
      this.price,
      this.image,
      this.quantity})
      : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int selectedQuantity = 1;
  late TextEditingController controller;
  double totalValue = 0.0;
  List<Product> selectedProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 120,
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
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Image.network(
                  widget.image ?? '',
                  fit: BoxFit.cover,
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}
