import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_siliconvillage/domain/contracts/database_contract.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';

class TaskController extends GetxController {
  final DatabaseContract database;
  final formKey = GlobalKey<FormState>();
  RxBool isUpdating = false.obs;

  TaskController(this.database);

  Future<void> toggleCheckbox(Task task) async {
    task.toggleTask();
    final response = await database.updateTask(task);
    response.fold(
      (left) => print(left),
      (right) => {},
    );
  }

  String formatDate(DateTime dateTime, String initialText) {
    final date = DateFormat('dd/MM/yyyy');
    final hour = DateFormat('HH:mm:ss');
    return '$initialText ${date.format(dateTime)} às ${hour.format(dateTime)}';
  }

  Future<void> updateTask(Task task) async {
    isUpdating.value = true;
    final response = await database.updateTask(task);
    response.fold(
      (left) => print(left),
      (right) => Get.back(result: task),
    );
  }
}
