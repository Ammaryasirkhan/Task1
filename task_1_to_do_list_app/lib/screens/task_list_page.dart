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

class TasksLists extends StatefulWidget {
  const TasksLists({super.key});

  @override
  State<TasksLists> createState() => _TasksListsState();
}

class _TasksListsState extends State<TasksLists> {
  final TaskController _taskController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: ColorRes.app,
            borderRadius: BorderRadius.circular(Dimensions.height30),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 5,
      ),
      body: Column(children: [
        SizedBox(
          height: Dimensions.height30,
        ),
        const AddTaskBar(),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.height15),
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: primaryColor,
            selectedTextColor: Colors.white,
            height: Dimensions.height40 * 3,
            width: 69,
            dateTextStyle: dateTextStyle,
            dayTextStyle: dayTextStyle,
            monthTextStyle: dayTextStyle,
            onDateChange: (newDate) {
              setState(() {
                _taskController.updateDate(newDate);
              });
            },
          ),
        ),
        SizedBox(height: Dimensions.height20),
        _showTaskList(),
      ]),
    );
  }

  _showTaskList() {
    return Obx(() {
      if (_taskController.filteredList.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) {
              final title = _taskController.filteredList[index].title!;
              final note = _taskController.filteredList[index].note!;
              final startTime = _taskController.filteredList[index].startTime!;
              final endTime = _taskController.filteredList[index].endTime!;
              final tileColor = _taskController.filteredList[index].color!;
              final isCompleted =
                  _taskController.filteredList[index].isCompleted!;
              final id = _taskController.filteredList[index].id!;
              return GestureDetector(
                onLongPress: () async {
                  _bottomSheet(isCompleted: isCompleted, id: id);
                },
                child: TaskTile(
                  tileColor: tileColor,
                  isCompleted: isCompleted,
                  title: title,
                  note: note,
                  endTime: endTime,
                  startTime: startTime,
                  onTap: () async =>
                      _taskController.updateTaskState(id, isCompleted),
                ),
              );
            },
            physics: const BouncingScrollPhysics(),
            itemCount: _taskController.filteredList.length,
          ),
        );
      } else {
        return const SizedBox(
          child: Text('No task today'),
        );
      }
    });
  }

  _bottomSheet({required int isCompleted, required int id}) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        color: context.theme.backgroundColor,
        height: isCompleted == 0
            ? MediaQuery.of(context).size.height * 0.3
            : MediaQuery.of(context).size.height * 0.23,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              height: 3.5,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.7)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
                children: [
                  isCompleted == 0
                      ? BottomSheetButton(
                          color: primaryColor,
                          label: 'Task Completed',
                          onTap: () async {
                            await _taskController.updateTaskState(
                                id, isCompleted);
                            Get.back();
                          },
                        )
                      : const SizedBox(),
                  BottomSheetButton(
                    color: pinkColor,
                    label: 'Delete Task',
                    onTap: () async {
                      await _taskController.deleteTask(id);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            BottomSheetButton(
              label: 'Close',
              onTap: Get.back,
            )
          ],
        ),
      ),
    );
  }
}
