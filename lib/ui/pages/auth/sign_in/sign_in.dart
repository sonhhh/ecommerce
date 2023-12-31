import 'package:ecommerce/ui/pages/auth/sign_in/provider_sign_in.dart';
import 'package:ecommerce/ui/pages/successfull/successfull.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field_email.dart';
import 'package:ecommerce/ui/pages/widget/text_field/text_field_password.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;
  late TextEditingController passwordTextController;
  late ObscureTextController obscurePasswordController;
  late ProviderSignIn signInProvider;
  String? username;
  String? password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController(text: 'mor_2314');
    passwordTextController = TextEditingController(text: '83r5^_');
    obscurePasswordController = ObscureTextController();
    signInProvider = context.read<ProviderSignIn>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              const Text("Welcome!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 40,
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
              const SizedBox(
                height: 40,
              ),
              Consumer<ProviderSignIn>(
                builder: (context, login, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            await login.getUser(
                                login.username = 'mor_2314',
                                login.password = '83r5^_');
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                              builder: (context) {
                                return const Successfull();
                              },
                            ));
                          },
                          style: ButtonStyle(
                            //  elevation: MaterialStateProperty.all(0),
                            overlayColor: MaterialStateProperty.all(
                                Colors.white.withOpacity(0.2)),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.black),
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
                    );
                }),
              const Center(child: Text('----------or----------')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.2)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.facebook, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Contineu with Google',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      //  elevation: MaterialStateProperty.all(0),
                      overlayColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.2)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Row(
                      children: [
                        Icon(MdiIcons.google, color: Colors.black),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Contineu with Google',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.2)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.apple, color: Colors.black),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Contineu with Apple',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
