import 'package:flutter/material.dart';

class AppTextFieldFrom extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String? labelText;
  final String? hintText;

  const AppTextFieldFrom({
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
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        ),
        keyboardType: textInputType,
        onChanged: onChanged,
        // style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}