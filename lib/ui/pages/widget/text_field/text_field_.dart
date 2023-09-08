import 'package:flutter/material.dart';

class AppTextFieldUser extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String? labelText;
  final String? hintText;

  const AppTextFieldUser({
    Key? key,
    this.controller,
    this.onChanged,
    this.textInputType,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                width: 3, color: Colors.black),
          ),
        ),
        keyboardType: textInputType,
        onChanged: onChanged,
        // style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}