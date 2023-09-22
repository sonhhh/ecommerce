import 'package:ecommerce/API/api_categories/carts.dart';
import 'package:ecommerce/ui/pages/detail/detail_provider.dart';
import 'package:ecommerce/ui/pages/detail/quantity_selector.dart';
import 'package:ecommerce/ui/pages/my_cart/my_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  final int? id;
  final String? category;
  final String? title;
  final double? price;
  final String? image;
  final String? description;

  Detail(
      {this.category,
      this.title,
      this.price,
      this.image,
      this.description,
      this.id});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int selectedQuantity = 1;
  late DetailProvider provider;


  @override
  void initState() {
    super.initState();
    provider = Provider.of<DetailProvider>(context, listen: false);
    provider.setCart(Carts(
        date: DateTime.now(),
        userId: 1,
        products: [Product(productId: widget.id ?? 0, quantity: 1)]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MyCart();
                    },
                  ));
                },
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 14,
              )
            ],
          ),
          SizedBox(
            height: 354,
            width: double.infinity,
            child: Center(
              child: Image.network(widget.image ?? '',
                  fit: BoxFit.cover, height: 320),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            height: 308,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.category ?? '',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 160,
                            child: Text(
                              widget.title ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      QuantitySelector(
                        initialValue: selectedQuantity,
                        onChanged: (quantity) {
                          setState(() {
                            selectedQuantity = quantity;
                          });
                        },
                      ),
                    ],
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: 16,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Description',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text(
                    widget.description ?? '',
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            '\$${(widget.price! * selectedQuantity).toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Consumer<DetailProvider>(
                        builder: (context, cartsProvide, child) {
                          return ElevatedButton(
                              onPressed: () async {
                                await cartsProvide.postCart();
                                if (selectedQuantity != 1) {
                                  provider.updateQuantity(
                                      widget.id ?? 0,
                                      Carts(
                                          id: 11,
                                          userId: 1,
                                          date: DateTime.now(),
                                          products: [
                                            Product(
                                                productId: widget.id,
                                                quantity: selectedQuantity)
                                          ]));
                                }
                                cartsProvide.addToCart(widget.id ?? 0, selectedQuantity);
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.white38),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black87),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
