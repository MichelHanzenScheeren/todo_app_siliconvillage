import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/domain/contracts/database_contract.dart';
import 'package:todo_app_siliconvillage/domain/models/task.dart';

class HomeController extends GetxController {
  final DatabaseContract database;
  final tasks = <Task>[].obs;
  RxBool isLoading = true.obs;

  HomeController(this.database);

  @override
  void onReady() {
    super.onReady();
    loadTasks();
  }

  Future<void> loadTasks() async {
    changeLoadingState(true);
    final response = await database.readTasks();
    response.fold(
      (left) => print(left),
      (right) => _registerTasks(right),
    );
    changeLoadingState(false);
  }

  void _registerTasks(newTasks) {
    tasks.addAll(newTasks);
    orderTasks();
  }

  void orderTasks() {
    tasks.sort((t1, t2) {
      if ((t1.checked && t2.checked) || (!t1.checked && !t2.checked)) {
        return t1.updatedDate.compareTo(t2.updatedDate);
      } else if (!t1.checked && t2.checked) {
        return -1;
      } else {
        return 1;
      }
    });
  }

  void changeLoadingState(bool value) {
    if (isLoading.value != value) {
      isLoading.value = value;
    }
  }

  Future<void> createTask(String text) async {
    if (text.trim() != '') {
      final newTask = Task(title: text);
      final response = await database.createTask(newTask);
      response.fold(
        (left) => print(left),
        (right) => tasks.insert(0, newTask),
      );
    }
  }

  Future<void> deleteTask(String taskId, int index) async {
    final response = await database.deleteTask(taskId);
    response.fold(
      (left) => print(left),
      (right) => tasks.removeAt(index),
    );
  }

  Future<void> toggleCheckbox(int index) async {
    final task = tasks[index];
    task.toggleTask();
    final response = await database.updateTask(task);
    response.fold(
      (left) => print(left),
      (right) => orderTasks(),
    );
  }
}
