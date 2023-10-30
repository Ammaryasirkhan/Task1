import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';

import 'Pages/main_page.dart';
import 'controller/task_controller.dart';
import 'Classes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  TaskController taskController = Get.put(TaskController());
  await taskController.getDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.lightMode,
        darkTheme: Themes.darkMode,
        themeMode: ThemeServices().theme,
        home: MainPage());
  }
}
