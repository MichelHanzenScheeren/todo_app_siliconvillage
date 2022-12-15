import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/home_controller.dart';
import 'package:todo_app_siliconvillage/shared/routes.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final int index;
  final homeController = Get.find<HomeController>();

  TaskWidget({
    super.key,
    required this.task,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(AppRoutes.taskScreen, arguments: task),
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 18,
          decoration:
              task.checked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      minLeadingWidth: 25,
      leading: IconButton(
        onPressed: () => homeController.toggleCheckbox(index),
        icon: Icon(
          task.checked ? Icons.check_box : Icons.check_box_outline_blank,
          color: task.checked ? Colors.grey : Colors.deepPurple,
        ),
      ),
      trailing: IconButton(
        onPressed: () => homeController.deleteTask(task.id, index),
        icon: Icon(
          Icons.delete,
          color: task.checked ? Colors.grey : Colors.red[400],
        ),
      ),
    );
  }
}
