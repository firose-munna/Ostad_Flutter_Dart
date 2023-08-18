import 'package:get/get.dart';
import 'package:taskmanager/data/model/networ_response.dart';
import 'package:taskmanager/data/services/networkCaller.dart';
import 'package:taskmanager/data/utils/urls.dart';

class UpdateTaskStatusBottomSheetController extends GetxController{
  bool _updateTaskInProgress = false;
  bool get updateTaskBottomSheetInProgress => _updateTaskInProgress;

  Future<bool> updateTask(String taskId, String newStatus) async {
    _updateTaskInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.updateTask(taskId, newStatus));
    _updateTaskInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}