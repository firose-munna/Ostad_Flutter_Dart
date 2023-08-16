import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/ui/screens/auth/emailVerificationScreen.dart';
import 'package:taskmanager/ui/screens/auth/signUpScreen.dart';
import 'package:taskmanager/ui/screens/bottomNavBaseScreen.dart';
import 'package:taskmanager/ui/stateManager/login_controller.dart';
import 'package:taskmanager/ui/widgets/screenBackground.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool showPassword = true;

    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Get Started With",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "*Enter your email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: showPassword,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (String? value) {
                      if ((value?.isEmpty ?? true) || value!.length <= 5) {
                        return "*Enter valid password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GetBuilder<LoginController>(builder: (loginController) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: loginController.loginInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              if (!_formkey.currentState!.validate()) {
                                return;
                              }
                              loginController.login(
                                  _emailController.text.trim(),
                                  _passwordController.text
                              ).then((result){
                                if(result == true){
                                  Get.offAll(()=> const BottomNavBaseScreen());
                                }
                                else{
                                  Get.snackbar('Failed', "Incorrect email or password");
                                }
                              });
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: InkWell(
                          onTap: () {
                            Get.to(()=> const EmailVerificationScreen());
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an Account?",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(()=> const SignUpScreen());
                          },
                          child: const Text("Sign Up"))
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
