import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class VisaCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        height: 250,
        child: Stack(
          children: [
            Positioned(
              width: 320,
              left: 0,
              child: CreditCardWidget(
                cardNumber: '1234 5678 9012 3456', // Thẻ Visa
                expiryDate: '12/24',
                cardHolderName: 'John Doe',
                cvvCode: '123',
                showBackView: false,
                cardType: CardType.visa,
                chipColor: Colors.yellow,
                onCreditCardWidgetChange: (CreditCardBrand ) {  },
                cardBgColor: Colors.grey,
              ),
            ),
            Positioned(
              top: 32.0,
              right: 0,
              width: 320,// Điều chỉnh vị trí theo y
              child: CreditCardWidget(
                cardNumber: '1234 5678 9012 3456', // Thẻ Visa
                expiryDate: '12/24',
                cardHolderName: 'John Doe',
                cvvCode: '123',
                showBackView: false,
                cardType: CardType.visa,
                cardBgColor: Colors.black,
                chipColor: Colors.yellow, onCreditCardWidgetChange: (CreditCardBrand ) {  }, // Màu nền cho thẻ Visa
              ),
            ),
          ],
        ),
      ),
    );

  }
}