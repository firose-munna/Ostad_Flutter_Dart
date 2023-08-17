import 'package:get/get.dart';
import 'package:taskmanager/data/model/networ_response.dart';
import 'package:taskmanager/data/services/networkCaller.dart';
import 'package:taskmanager/data/utils/urls.dart';
import 'package:taskmanager/ui/stateManager/get_task_controller.dart';

class DeleteTaskController extends GetxController {
  final GetTasksController _getTasksController = Get.find<GetTasksController>();

  Future<bool> deleteTask(String taskId) async {
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.deleteTask(taskId));

    if (response.isSuccess) {
      _getTasksController.taskListModel.data!.removeWhere((element) => element.sId == taskId);
      _getTasksController.updateFunction();
      return true;
    } else {
      return false;
    }
  }
}