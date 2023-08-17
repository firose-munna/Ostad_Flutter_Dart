import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/data/model/taskListModel.dart';
import 'package:taskmanager/data/utils/urls.dart';
import 'package:taskmanager/ui/screens/updateTaskStatusBottomSheet.dart';
import 'package:taskmanager/ui/stateManager/delete_task_controller.dart';
import 'package:taskmanager/ui/stateManager/get_task_controller.dart';
import 'package:taskmanager/ui/stateManager/summary_count_controller.dart';
import 'package:taskmanager/ui/widgets/iteam_card.dart';
import 'package:taskmanager/ui/widgets/screenBackground.dart';
import 'package:taskmanager/ui/widgets/summary_card.dart';
import 'package:taskmanager/ui/widgets/taskListTile.dart';
import 'package:taskmanager/ui/widgets/userProfileBanner.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  final GetTasksController _getTasksController = Get.find<GetTasksController>();
  final SummaryCountController _summaryCountController = Get.find<SummaryCountController>();
  final DeleteTaskController _deleteTaskController = Get.find<DeleteTaskController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _summaryCountController.getCountSummary().then((result) {
        if (result == false) {
          Get.snackbar('Failed', "Summary data get failed");
        }
      },
      );
      _getTasksController.getTasks(Urls.completeTasks).then((result) {
        if (result == false) {
          Get.snackbar('Failed', "Completed Tasks get failed");
        }
      },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: Column(
            children: [
              const UserProfileBanner(),
              GetBuilder<SummaryCountController>(
                builder: (_) {
                  if (_summaryCountController.getCountSummaryInProgress) {
                    return const Center(
                      child: LinearProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _summaryCountController.summaryCountModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return SummeryCard(
                            title: _summaryCountController.summaryCountModel.data![index].sId ?? 'New',
                            number: _summaryCountController.summaryCountModel.data![index].sum ?? 0,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 4,
                          );
                        },
                      ),
                    ),

                  );
                }
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _summaryCountController.getCountSummary().then((result) {
                      if (result == false) {
                        Get.snackbar('Failed', "Summary data get failed");
                      }
                    },
                    );
                    _getTasksController.getTasks(Urls.completeTasks).then((result) {
                      if (result == false) {
                        Get.snackbar('Failed', "Completed Tasks get failed");
                      }
                    },
                    );
                  },
                  child: GetBuilder<GetTasksController>(
                    builder: (_) {
                      return _getTasksController.getTaskInProgress
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: _getTasksController.taskListModel.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                return ItemCard(
                                  child: TaskListTile(
                                    data: _getTasksController.taskListModel.data![index],
                                    onDeleteTab: () {
                                      _deleteTaskController.deleteTask(_getTasksController.taskListModel.data![index].sId!).then((result) {
                                        if (result == false) {
                                          Get.snackbar('Failed', "Task Deletion failed");
                                        }},
                                      );},
                                    onEditTab: () {showStatusUpdateBottomSheet(_getTasksController.taskListModel.data![index]);},
                                  ),
                                );
                              },
                            );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showStatusUpdateBottomSheet(TaskData task) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return UpdateTaskStatusSheet(task: task, onUpdate: () {
          _getTasksController.getTasks(Urls.completeTasks).then((result) {
            if (result == false) {
              Get.snackbar('Failed', "Completed Tasks get failed");
            }
          },
          );
        });
      },
    );
  }
}
