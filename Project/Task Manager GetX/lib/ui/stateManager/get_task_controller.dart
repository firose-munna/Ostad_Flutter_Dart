import 'package:get/get.dart';
import 'package:taskmanager/data/model/networ_response.dart';
import 'package:taskmanager/data/model/taskListModel.dart';
import 'package:taskmanager/data/services/networkCaller.dart';

class GetTasksController extends GetxController {
  bool _getTaskInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  void getUpdateState() {
    update();
  }

  bool get getTaskInProgress => _getTaskInProgress;

  TaskListModel get taskListModel => _taskListModel;

  Future<bool> getTasks(String url) async {
    _getTaskInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(url);
    _getTaskInProgress = false;
    update();
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
      update();
      return true;
    } else {
      return false;
    }
  }

  void updateFunction(){
    update();
  }
}