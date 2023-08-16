import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/SplashScreen.dart';
import 'package:get/get.dart';
import 'package:taskmanager/ui/stateManager/login_controller.dart';




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

  }
}