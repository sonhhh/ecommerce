import 'package:ecommerce/API/api_categories/carts.dart';
import 'package:ecommerce/ui/pages/detail/detail_provider.dart';
import 'package:ecommerce/ui/pages/detail/quantity_selector.dart';
import 'package:ecommerce/ui/pages/my_cart/my_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    // Sử dụng ScreenUtil để thích nghi với kích thước màn hình
    ScreenUtil.init(context,
      designSize: Size(375, 812), // Kích thước màn hình gốc
    );
    return Scaffold(
        body: SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Column(
        children: [
           SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SizedBox(
                width: 12.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24.sp,
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
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
               SizedBox(
                width: 14.w,
              )
            ],
          ),
          SizedBox(
            height: 354.h,
            width: 1.sw,
            child: Center(
              child: Image.network(widget.image ?? '',
                  fit: BoxFit.cover, height: 320.h),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            height: 310.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: const Offset(0, -3), // changes position of shadow
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
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 160.w,
                            child: Text(
                              widget.title ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 88.w,
                        child: QuantitySelector(
                          initialValue: selectedQuantity,
                          onChanged: (quantity) {
                            setState(() {
                              selectedQuantity = quantity;
                            });
                          },
                        ),
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
                   SizedBox(
                    height: 20.h,
                  ),
                  const Text('Description',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text(
                    widget.description ?? '',
                    style:  TextStyle(fontSize: 14.sp, color: Colors.black),
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
                            style:  TextStyle(
                                fontSize: 20.sp,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 24.sp,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        fontSize: 16.sp,
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
