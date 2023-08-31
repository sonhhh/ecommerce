import 'package:ecommerce/ui/pages/utils/utils.dart';
import 'package:flutter/material.dart';


class ObscureController extends ValueNotifier<bool> {
  ObscureController({bool obscureText = true}) : super(obscureText);

  bool get date => value;

  set date(bool obscureText) {
    value = obscureText;
  }
}

class AppConfirmPasswordTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final ObscureController obscureController;
  final ValueChanged<String>? onChanged;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;

  const AppConfirmPasswordTextField({
    Key? key,
    required this.textEditingController,
    required this.obscureController,
    this.onChanged,
    this.labelText = "Password",
    this.hintText,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: obscureController,
          child: Container(),
          builder: (context, bool obscureText, child) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: const UnderlineInputBorder(borderSide:  BorderSide(
                    width: 3, color: Colors.black)),
                //prefixIcon: const Icon(Icons.password_outlined),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: obscureController,
                  child: Container(),
                  builder: (context, bool obscureText, child) {
                    return IconButton(
                      splashRadius: 24,
                      onPressed: () {
                        Future.delayed(Duration.zero, () {
                          focusNode?.unfocus();
                        });
                        obscureController.value = !obscureText;
                      },
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    );
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              onChanged: onChanged,
              obscureText: obscureController.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                if (!Utils.isPassword(value)) {
                  return "Password requires at least 8 characters, one uppercase letter, one lowercase letter, one digit, and one special character.";
                }
                return null;
              },
              // style: const TextStyle(fontSize: 16, color: Colors.black),
            );
          },
        ),
      ],
    );
  }
}