import 'package:get/get.dart';
import 'package:taskmanager/data/model/networ_response.dart';
import 'package:taskmanager/data/services/networkCaller.dart';
import 'package:taskmanager/data/utils/urls.dart';

class PinVerificationController extends GetxController{
  bool _otpVerificationInProgress = false;
  bool get otpVerificationInProgress => _otpVerificationInProgress;

  Future<bool> verifyOTP(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.otpVerify(email, otp));
    _otpVerificationInProgress = false;
    update();
    if (response.body!['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  }
}