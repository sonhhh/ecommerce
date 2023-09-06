
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String? labelText;
  final String? hintText;
  final VoidCallback? onButtonPressed;

  const AppTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.textInputType,
    this.labelText,
    this.hintText,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        //padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.centerRight, // Căn nút bên phải
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: textInputType,
              onChanged: onChanged,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 80,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black),
                child: const Center(
                  child: Text('Apply',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
