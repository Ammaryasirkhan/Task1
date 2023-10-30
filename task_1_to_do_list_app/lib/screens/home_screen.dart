import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_1_to_do_list_app/Classes/dimensions.dart';
import '../Classes/colors.dart';
import '../Widgets/big_text.dart';
import '../Widgets/card_task.dart';
import '../controller/task_controller.dart';
import '../Classes/components.dart';
import '../Classes/theme.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController _taskController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskController.loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
                color: ColorRes.app,
                borderRadius: BorderRadius.circular(Dimensions.height30))),
        backgroundColor: Colors.transparent,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Image.asset(
                    'assets/images/image1.png',
                    fit: BoxFit.contain,
                    height: Dimensions.height40 * 5,
                  ),
                  BigText(
                    text: 'Manage Your Everday Task List',
                    size: Dimensions.text20 * 1.5,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  TaskCard(
                    imagePath: 'assets/images/i.png',
                    title: 'Create Your Task',
                    description: 'Your task description here',
                    onPressed: () {
                      Get.to(() => const AddTaskScreen());
                    },
                    color: ColorRes.app,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  TaskCard(
                    imagePath: 'assets/images/ii.png',
                    title: 'Task Suggestions For You',
                    description: 'Your task description here',
                    onPressed: () {
                      // Handle the onPressed action
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => CreateTask(),
                      // ));
                    },
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
          ],
        ),
      ),
    );
  }
}
