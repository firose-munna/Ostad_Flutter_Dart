import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/ui/screens/auth/login_screen.dart';
import 'package:taskmanager/ui/screens/auth/setPasswordScreen.dart';
import 'package:taskmanager/ui/stateManager/pin_verification_controller.dart';
import 'package:taskmanager/ui/widgets/screenBackground.dart';

class PinVerificationScreen extends StatefulWidget {
  final String email;
  const PinVerificationScreen({super.key, required this.email});
  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final PinVerificationController _pinVerificationController = Get.find<PinVerificationController>();

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      onPressed:  _pinVerificationController.otpVerificationInProgress== true ? null : () async {
        if (_formkey.currentState!.validate() == false) {
          return;
        } else {
          await _pinVerificationController.verifyOTP(widget.email, _otpController.text.trim()).then((result) {
              if (result == true) {
                _formkey.currentState!.reset();
                Get.snackbar('Wow!', "Otp verification Successful");
                Get.to(()=> SetPasswordScreen(email: widget.email, otp: _otpController.text.trim()));
              }
              else{
                Get.snackbar('Failed', "Otp verification has been Failed!");
              }
            },
          );
        }
      },
      child: Visibility(
        visible: _pinVerificationController.otpVerificationInProgress == false,
        replacement: const CircularProgressIndicator(),
        child: const Text('Verify', style: TextStyle(fontSize: 16),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    "PIN Verification",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    "Enter 6 digit verification PIN here",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Form(
                    key: _formkey,
                    child: PinCodeTextField(
                      controller: _otpController,
                      length: 6,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.teal,
                        inactiveFillColor: Colors.white,
                        inactiveColor: Colors.white,
                        activeColor: Colors.white,
                        selectedFillColor: Colors.white,
                        selectedColor: Colors.teal
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      cursorColor: Colors.teal,

                      enableActiveFill: true,
                      enablePinAutofill: true,

                      onCompleted: (v) {
                      },
                      onChanged: (value) {
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                      appContext: context,
                      validator: (String? value){
                        if(value?.isEmpty?? true){
                          return "*Enter your email";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),



                  GetBuilder<PinVerificationController>(
                    builder: (_) {
                      return SizedBox(
                        width: double.infinity,
                        child: buildSubmitButton(),
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
                        Get.offAll(()=> const LoginScreen());
                      }, child: const Text("Sign In"))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
