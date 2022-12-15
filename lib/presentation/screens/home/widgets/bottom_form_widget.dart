import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/home_controller.dart';

class BottomFormWidget extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  BottomFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 10.0),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        autofocus: true,
        onSubmitted: (string) {
          Get.back();
          homeController.createTask(string);
        },
        decoration: const InputDecoration(
          hintText: 'Adicione uma nova tarefa',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
