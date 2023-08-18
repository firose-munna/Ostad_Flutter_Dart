import 'package:get/get.dart';
import 'package:taskmanager/data/model/networ_response.dart';
import 'package:taskmanager/data/services/networkCaller.dart';
import 'package:taskmanager/data/utils/urls.dart';

class ProfileUpdateController extends GetxController{

  bool _profileInProgress = false;
  bool get profileUpdateInProgress => _profileInProgress;

  Future<bool> updateProfile(String firstName, String lastName, String mobile, String password) async {
    _profileInProgress = true;
    update();
    final Map<String, dynamic> requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "photo": ""
    };
    if (password.isNotEmpty) {
      requestBody['password'] = password;
    }

    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.updateProfile, requestBody);
    _profileInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}