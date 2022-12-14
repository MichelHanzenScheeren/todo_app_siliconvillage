import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/domain/contracts/database_contract.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';

class HomeController extends GetxController {
  final tasks = <Task>[].obs;
  RxBool isLoading = true.obs;
  final DatabaseContract database;

  HomeController(this.database);

  @override
  void onReady() {
    super.onReady();
    loadTasks();
  }

  Future<void> loadTasks() async {
    changeLoadingState(true);
    await Future.delayed(const Duration(seconds: 10));
    changeLoadingState(false);
  }

  void changeLoadingState(bool value) {
    if (isLoading.value != value) {
      isLoading.value = value;
    }
  }
}
