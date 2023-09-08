import 'package:ecommerce/ui/pages/auth/sign_in/sign_in.dart';
import 'package:ecommerce/ui/pages/auth/sign_up/agreement_checkbox.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field_.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field_email.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field_obscure.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field_password.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController emailController;
  late TextEditingController passwordTextController;
  late ObscureTextController obscurePasswordController;
  late TextEditingController controller;
  late ObscureController obscureController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    emailController = TextEditingController();
    passwordTextController = TextEditingController();
    obscurePasswordController = ObscureTextController();
    obscureController = ObscureController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Center(
                  child: Image(
                image: AssetImage('assets/introl/login_logo.webp'),
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              )),
              const Text("Sign Up",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 60,
              ),
              const Row(
                children: [
                  Text('User Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
              AppTextFieldUser(
                controller: controller,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
              AppEmailTextField(
                textEditingController: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
              AppPasswordTextField(
                textEditingController: passwordTextController,
                obscureTextController: obscurePasswordController,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Confirm Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
              AppConfirmPasswordTextField(
                  textEditingController: confirmPasswordController,
                  obscureController: obscureController),
              const Expanded(child: AgreementCheckbox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return SignIn();
                      },));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.2)),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              )
            ],
          ),
        ),
    );
  }
}
