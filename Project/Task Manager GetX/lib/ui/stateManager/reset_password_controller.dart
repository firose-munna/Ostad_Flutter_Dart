import 'package:get/get.dart';
import 'package:taskmanager/data/model/networ_response.dart';
import 'package:taskmanager/data/services/networkCaller.dart';
import 'package:taskmanager/data/utils/urls.dart';

class ResetPasswordController extends GetxController {
  bool _setPasswordInProgress = false;
  bool get setPasswordInProgress => _setPasswordInProgress;

  Future<bool> resetPassword(String email, String otp, String password) async {
    _setPasswordInProgress = true;
    update();

    final Map<String, dynamic> requestBody = {
      "email": email,
      "OTP": otp,
      "password": password
    };
    final NetworkResponse response = await NetworkCaller().postRequest(Urls.resetPassword, requestBody);
    _setPasswordInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}