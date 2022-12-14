import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/home_controller.dart';
import 'package:todo_app_siliconvillage/presentation/widgets/progress_widget.dart';

class HomeScreen extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App - Silicon Village'),
      ),
      body: Center(
        child: Obx(() {
          return Visibility(
            visible: !homeController.isLoading.value,
            replacement: const ProgressWidget(),
            child: const Text('Terminou de carregar...'),
          );
        }),
      ),
    );
  }
}
