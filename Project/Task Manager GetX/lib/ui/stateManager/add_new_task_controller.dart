import 'package:get/get.dart';
import 'package:taskmanager/data/model/networ_response.dart';
import 'package:taskmanager/data/services/networkCaller.dart';
import 'package:taskmanager/data/utils/urls.dart';

class AddNewTaskController extends GetxController {
  bool _addNewTaskInProgress = false;
  bool get addNewTaskInProgress => _addNewTaskInProgress;

  Future<bool> addNewTask(String title, String description, String status) async {
    _addNewTaskInProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": status
    };

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.createTask, requestBody);
    _addNewTaskInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}