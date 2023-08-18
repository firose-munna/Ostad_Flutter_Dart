import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/data/model/taskListModel.dart';
import 'package:taskmanager/ui/stateManager/update_task_status_bottom_sheet_controller.dart';

class UpdateTaskStatusSheet extends StatefulWidget {
  final TaskData task;
  final VoidCallback onUpdate;

  const UpdateTaskStatusSheet(
      {Key? key, required this.task, required this.onUpdate})
      : super(key: key);

  @override
  State<UpdateTaskStatusSheet> createState() => _UpdateTaskStatusSheetState();
}

class _UpdateTaskStatusSheetState extends State<UpdateTaskStatusSheet> {
  List<String> taskStatusList = ['New', 'Progress', 'Canceled', 'Completed'];
  late String _selectedTask;
  final UpdateTaskStatusBottomSheetController _updateTaskStatusBottomSheetController = Get.find<UpdateTaskStatusBottomSheetController>();
  @override
  void initState() {
    _selectedTask = widget.task.status!.toLowerCase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Row(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Text(
                  'Update Status',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),

          Expanded(
            child: ListView.builder(
                itemCount: taskStatusList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      _selectedTask = taskStatusList[index];
                      setState(() {});
                    },
                    title: Text(taskStatusList[index].toUpperCase()),
                    trailing: _selectedTask == taskStatusList[index]
                        ? const Icon(Icons.check)
                        : null,
                  );
                }),
          ),
          GetBuilder<UpdateTaskStatusBottomSheetController>(
            builder: (_) {
              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Visibility(
                      visible: _updateTaskStatusBottomSheetController.updateTaskBottomSheetInProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(

                            onPressed: () {
                              _updateTaskStatusBottomSheetController.updateTask(widget.task.sId!, _selectedTask).then((result) {
                                if (result == true) {

                                  widget.onUpdate();
                                  Get.back();
                                  //Get.snackbar('Wow!', "Update task status Change Successfully");
                                }
                                else{
                                  Get.snackbar('Failed', "Update task status has been failed");
                                }
                              },
                              );
                            },
                            child: const Text('Update')),
                      )));
            }
          )
        ],
      ),
    );
  }
}