import 'package:flutter/material.dart';

class AgreementCheckbox extends StatefulWidget {
  const AgreementCheckbox({super.key});

  @override
  _AgreementCheckboxState createState() => _AgreementCheckboxState();
}

class _AgreementCheckboxState extends State<AgreementCheckbox> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: agreed,
              onChanged: (value) {
                setState(() {
                  agreed = value!;
                });
              },
            ),
            const SizedBox(width: 4),
            const Text(
              'I agree to the terms and conditions',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
