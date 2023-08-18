import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/ui/screens/bottomNavBaseScreen.dart';
import 'package:taskmanager/ui/stateManager/add_new_task_controller.dart';
import 'package:taskmanager/ui/widgets/screenBackground.dart';
import 'package:taskmanager/ui/widgets/userProfileBanner.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final AddNewTaskController _addNewTaskController = Get.find<AddNewTaskController>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBackground(
          child: Column(
            children: [
              const UserProfileBanner(isInProfileUpdateScreen: false,),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Add New Task",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: _subjectController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: "Subject",
                            ),
                            validator: (String? value){
                              if(value?.isEmpty?? true){
                                return "*Enter subject";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: _descriptionController,
                            maxLines: 10,
                            decoration: const InputDecoration(
                              hintText: "Description",
                            ),
                            validator: (String? value){
                              if(value?.isEmpty?? true){
                                return "*Enter description";
                              }
                              return null;
                            },

                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          GetBuilder<AddNewTaskController>(
                            builder: (_) {
                              return SizedBox(
                                width: double.infinity,
                                child: Visibility(
                                  visible: _addNewTaskController.addNewTaskInProgress == false,
                                  replacement: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if(!_formkey.currentState!.validate()){
                                          return;
                                        }
                                        _addNewTaskController.addNewTask(_subjectController.text.trim(), _descriptionController.text.trim(), "New").then((result) {
                                          if (result == true) {
                                            _subjectController.clear();
                                            _descriptionController.clear();
                                            Get.snackbar('Wow!', "Task added successfully");
                                            Get.offAll(()=>const BottomNavBaseScreen());
                                          }
                                          else{
                                            Get.snackbar('Failed', "Task add failed!");
                                          }
                                        },
                                        );
                                      },
                                      child: const Text("Add Task", style: TextStyle(fontSize: 16),)),
                                ),
                              );
                            }
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
