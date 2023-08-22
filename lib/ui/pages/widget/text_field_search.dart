import 'package:flutter/material.dart';

class AppTextFieldSearch extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String? labelText;
  final String? hintText;

  const AppTextFieldSearch({
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
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(),),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: "Search",
            border: InputBorder.none,
          ),
          keyboardType: textInputType,
          onChanged: onChanged,
        ),
      ),
    );
  }
}