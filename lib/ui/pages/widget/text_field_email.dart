import 'package:ecommerce/ui/pages/utils/utils.dart';
import 'package:flutter/material.dart';


class AppEmailTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChanged;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;

  const AppEmailTextField({
    Key? key,
    // required this.formKey,
    required this.textEditingController,
    this.onChanged,
    this.labelText = "Email",
    this.hintText,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
        width: 3, color: Colors.black),
          ),
       //   border: const OutlineInputBorder(),
         // prefixIcon: const Icon(Icons.email_outlined),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter email';
          }
          if (!Utils.isEmail(value)) {
            return "Email invalid";
          }
          return null;
        },
        // style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}