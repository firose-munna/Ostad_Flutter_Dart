import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/SplashScreen.dart';
import 'package:get/get.dart';
import 'package:taskmanager/ui/stateManager/add_new_task_controller.dart';
import 'package:taskmanager/ui/stateManager/delete_task_controller.dart';
import 'package:taskmanager/ui/stateManager/email_verification_controller.dart';
import 'package:taskmanager/ui/stateManager/get_task_controller.dart';
import 'package:taskmanager/ui/stateManager/login_controller.dart';
import 'package:taskmanager/ui/stateManager/pin_verification_controller.dart';
import 'package:taskmanager/ui/stateManager/profile_update_controller.dart';
import 'package:taskmanager/ui/stateManager/reset_password_controller.dart';
import 'package:taskmanager/ui/stateManager/signup_controller.dart';
import 'package:taskmanager/ui/stateManager/summary_count_controller.dart';
import 'package:taskmanager/ui/stateManager/update_task_status_bottom_sheet_controller.dart';




class TaskManagerApp extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: TaskManagerApp.globalKey,
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      theme: ThemeData(
          brightness: Brightness.light,
        primarySwatch: Colors.teal,
        inputDecorationTheme:  const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          )

        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.black)
        )
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      themeMode: ThemeMode.light,

      home: const SplashScreen(),
      initialBinding: ControllerBinding(),

    );
  }
}
class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SummaryCountController>(SummaryCountController());
    Get.put<GetTasksController>(GetTasksController());
    Get.put<DeleteTaskController>(DeleteTaskController());
    Get.put<SignupController>(SignupController());
    Get.put<PinVerificationController>(PinVerificationController());
    Get.put<EmailVerificationController>(EmailVerificationController());
    Get.put<ResetPasswordController>(ResetPasswordController());
    Get.put<AddNewTaskController>(AddNewTaskController());
    Get.put<ProfileUpdateController>(ProfileUpdateController());
    Get.put<UpdateTaskStatusBottomSheetController>(UpdateTaskStatusBottomSheetController());
  }
}