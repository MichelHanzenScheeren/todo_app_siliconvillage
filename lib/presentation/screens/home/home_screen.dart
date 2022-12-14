import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/home_controller.dart';
import 'package:todo_app_siliconvillage/presentation/screens/home/widgets/bottom_form_widget.dart';
import 'package:todo_app_siliconvillage/presentation/widgets/progress_widget.dart';
import 'package:todo_app_siliconvillage/presentation/screens/home/widgets/task_widget.dart';

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
            child: Visibility(
              visible: homeController.tasks.isNotEmpty,
              replacement: const Center(
                child: Text(
                  'Nada para fazer por enquanto...',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 80),
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
