import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/task_controller.dart';

class TaskScreen extends StatelessWidget {
  final Task task = Get.arguments;
  final taskController = Get.find<TaskController>();
  TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(task.title);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App - Silicon Village'),
      ),
      body: Container(),
    );
  }
}
