import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/ui/screens/auth/login_screen.dart';
import 'package:taskmanager/ui/stateManager/reset_password_controller.dart';
import 'package:taskmanager/ui/widgets/screenBackground.dart';

class SetPasswordScreen extends StatefulWidget {
  final String email, otp;
  const SetPasswordScreen({super.key, required this.email, required this.otp});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ResetPasswordController _resetPasswordController = Get.find<ResetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      "Set Password",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 6,
                    ),

                    Text(
                      "Minimum length password 8 character with letter and number combination",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),

                    TextFormField(
                      controller: _passwordController,

                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '*Enter your password';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,

                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '*Enter your Confirm password';
                        }
                        else if (value! != _passwordController.text) {
                          return 'Confirm password does n\'t match';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    GetBuilder<ResetPasswordController>(
                      builder: (_) {
                        return SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: _resetPasswordController.setPasswordInProgress == false,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                _resetPasswordController.resetPassword(widget.email, widget.otp, _passwordController.text).then((result) {
                                  if (result == true) {
                                    Get.snackbar('Wow!', "Password reset successful!");
                                    Get.offAll(()=> const LoginScreen());
                                  }
                                  else{
                                    Get.snackbar('Failed', "Reset password has been failed!");
                                  }
                                },
                                );
                              },
                              child: const Text("Confirm", style: TextStyle(fontSize: 16),),
                            ),
                          ),
                        );
                      }
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have account?",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextButton(onPressed: () {
                          Get.offAll(()=>const LoginScreen());
                        }, child: const Text("Sign In"))
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
