import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/task_controller.dart';
import 'package:todo_app_siliconvillage/presentation/screens/task/widgets/task_button_widget.dart';
import 'package:todo_app_siliconvillage/presentation/screens/task/widgets/task_form_widget.dart';

class TaskScreen extends StatelessWidget {
  final Task task = Get.arguments;
  final taskController = Get.find<TaskController>();
  TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App - Silicon Village'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: taskController.formKey,
              child: Column(
                children: [
                  TaskFormWidget(
                    initialValue: task.title,
                    labelText: 'Título',
                    onSaved: (String? value) =>
                        task.updateTask(newTitle: value ?? ''),
                  ),
                  TaskFormWidget(
                    initialValue: task.description,
                    labelText: 'Descrição',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 5,
                    onSaved: (String? value) =>
                        task.updateTask(newDescription: value ?? ''),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      taskController.formatDate(
                        task.createdDate,
                        'Criado em',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 60),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      taskController.formatDate(
                        task.updatedDate,
                        'Atualizado em',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TaskButtonWidget(onPressed: () {
            taskController.formKey.currentState?.save();
            taskController.updateTask(task);
          }),
        ],
      ),
    );
  }
}
