import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/home_controller.dart';
import 'package:todo_app_siliconvillage/presentation/widgets/bottom_form_widget.dart';
import 'package:todo_app_siliconvillage/presentation/widgets/progress_widget.dart';
import 'package:todo_app_siliconvillage/presentation/widgets/task_widget.dart';

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
            child: ListView.separated(
              itemCount: homeController.tasks.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  task: homeController.tasks[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  height: 0,
                );
              },
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.bottomSheet(BottomFormWidget()),
      ),
    );
  }
}
