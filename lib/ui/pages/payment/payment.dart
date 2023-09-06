import 'package:ecommerce/ui/pages/widget/show_dia_log/dia_log.dart';
import 'package:ecommerce/ui/pages/widget/text_field/from.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field.dart';
import 'package:ecommerce/ui/pages/widget/visa/visa_card_widget.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late TextEditingController cardController;
  late TextEditingController dateController;
  late TextEditingController cvvController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardController = TextEditingController();
    dateController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 44,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                )),
            const SizedBox(
              height: 20,
            ),
            const Text("Payment",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 240,
              child: VisaCardWidget(),
            ),
            const Text(
              'Card Details',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 20),
            AppTextFieldFrom(
                controller: cardController, hintText: 'Card Details'),
            const SizedBox(height: 12),
            AppTextFieldFrom(controller: cardController, hintText: 'Exp date'),
            const SizedBox(height: 12),
            AppTextFieldFrom(controller: cardController, hintText: 'CVV'),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PlaceholderDialog(
                          icon: const Icon(Icons.check_circle,
                              color: Colors.black, size: 53),
                          title: 'Successful',
                          message:
                              'You have successful your \n Confirm Payment !',
                          actions: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 44,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Center(
                                  child: Text('continue Shopping',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 53,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text('Confirm',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
