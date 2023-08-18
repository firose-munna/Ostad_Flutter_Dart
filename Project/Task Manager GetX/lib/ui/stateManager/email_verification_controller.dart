import 'package:get/get.dart';
import 'package:taskmanager/data/model/networ_response.dart';
import 'package:taskmanager/data/services/networkCaller.dart';
import 'package:taskmanager/data/utils/urls.dart';

class EmailVerificationController extends GetxController{
  bool _emailSendInProgress = false;
  bool get emailSendInProgress => _emailSendInProgress;

  Future<bool> sendOTPToEmail(String email) async {
    _emailSendInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.sendOtpToEmail(email));
    _emailSendInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}