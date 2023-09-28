import 'package:ecommerce/API/api_categories/carts.dart';
import 'package:ecommerce/model/enum/load_status.dart';
import 'package:ecommerce/ui/pages/detail/detail_provider.dart';
import 'package:ecommerce/ui/pages/detail/quantity_selector.dart';
import 'package:ecommerce/ui/pages/my_cart/my_carts_provider.dart';
import 'package:ecommerce/ui/pages/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  int? id;
  int? quantity;

  MyCart({Key? key, this.id, this.quantity}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late DetailProvider provider;
  int? quantity;
  double totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<DetailProvider>(context, listen: false);
  }

  List<double> productPrices = [];

// Hàm tính tổng
  double calculateTotalPrice(List<double> prices) {
    double totalPrice = 0;
    for (double price in prices) {
      totalPrice += price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng ScreenUtil để thích nghi với kích thước màn hình
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Kích thước màn hình gốc
    );
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 110.h,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 24.sp,
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                    size: 24.sp,
                  ))
            ],
          ),
          Text('My Cart',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Consumer<DetailProvider>(builder: (context, detail, child) {
            if (detail.loadStatus == LoadStatus.success) {
              return ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: detail.cartsMap.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  final productId = detail.cartsMap.keys.elementAt(index);
                  var quantity = detail.cartsMap[productId];
                  final product = detail.product;
                  int quantityUpdate = detail.quantityUpdate ?? quantity ?? 0;
                  final int updatedQuantity = quantityUpdate;
                  return Container(
                    height: 120.h,
                    padding: const EdgeInsets.symmetric(horizontal:8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(product?.image ?? '',
                              fit: BoxFit.cover, width: 120.w),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                product?.title ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              product?.category ?? '',
                              style: TextStyle(
                                  fontSize: 13.sp, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Text(
                              "\$${detail.product?.price}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Consumer2<DetailProvider, MyCartsProvider>(
                          builder: (context, detail1, myCart, child) {
                            return SizedBox(
                              width: 88,
                              child: QuantitySelector(
                                initialValue: quantity ?? 0,
                                onChanged: (newQuantity) {
                                  setState(() {
                                    quantity = newQuantity;
                                    detail1.updateQuantity(
                                        widget.id ?? 0,
                                        Carts(
                                            id: 11,
                                            userId: 1,
                                            date: DateTime.now(),
                                            products: [
                                              Product(
                                                  productId: productId,
                                                  quantity: newQuantity)
                                            ]));
                                    if (newQuantity == 0) {
                                      myCart.removeFromCart(productId, 0);
                                    }
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
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
          SizedBox(
            height: 50.h,
          ),
          Consumer2<DetailProvider, MyCartsProvider>(
            builder: (context, detail1, myCart, child) {
              final product = detail1.product;
              final quantity = detail1.quantityUpdate;
              final int cartsMapQuantity = detail1.cartsMap[product?.id] ?? 0;
              final int updatedQuantity = quantity ?? 0;
              double price = (product?.price ?? 0) *
                  (updatedQuantity >= cartsMapQuantity
                      ? updatedQuantity
                      : cartsMapQuantity);
              return Container(
                padding: const EdgeInsets.all(12),
                height: 167.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${(price).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$17',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BagTotal:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${(price + 17).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 80.h,
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
              width: 1.sw,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text('Proceed to Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp)),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
