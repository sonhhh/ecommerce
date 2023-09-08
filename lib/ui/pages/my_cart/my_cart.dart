import 'package:ecommerce/model/enum/data_fix.dart';
import 'package:ecommerce/ui/pages/detail/quantity_selector.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

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
    totalValue = selectedProducts
        .map((product) => product.price ?? 0)
        .fold(0, (prev, price) => prev + price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 44,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined,
                        color: Colors.black, size: 20),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'My Cart',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // margin: const EdgeInsets.only(left: 8, right: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myCart.length,
                  // Example itemCount
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Slidable(
                        endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 1,
                            children: [
                              SlidableAction(
                                onPressed: (context) {},
                                borderRadius: BorderRadius.circular(10),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black,
                                icon: Icons.delete,
                              )
                            ]),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          height: 88,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Colors.black45, width: 0.5)),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(myCart[index].image ?? '',
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    myCart[index].nameProduct ?? '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    myCart[index].nameCategori ?? '',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${myCart[index].price ?? ''}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 28,
                                      ),
                                      QuantitySelector(
                                        initialValue: selectedProducts
                                            .where((product) =>
                                                product.nameProduct ==
                                                myCart[index].nameProduct)
                                            .length,
                                        onChanged: (quantity) {
                                          setState(() {
                                            if (quantity > 0) {
                                              final product = Product(
                                                myCart[index].image,
                                                myCart[index].nameProduct,
                                                myCart[index].nameCategori,
                                                myCart[index].price,
                                              );
                                              selectedProducts.add(product);
                                            } else {
                                              selectedProducts.removeWhere(
                                                  (product) =>
                                                      product.nameProduct ==
                                                      myCart[index]
                                                          .nameProduct);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              AppTextFieldApply(
                controller: controller,
                hintText: 'Promo Code',
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total(${selectedProducts.length} item): ",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    '\$${totalValue.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(12),
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Proceed to Checkout',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Icon(
                        Icons.arrow_forward,
                        size: 32,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
