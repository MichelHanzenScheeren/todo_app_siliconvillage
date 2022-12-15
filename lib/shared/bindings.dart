import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/data/repositories/firestore_repository.dart';
import 'package:todo_app_siliconvillage/domain/contracts/database_contract.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/home_controller.dart';
import 'package:todo_app_siliconvillage/presentation/controllers/task_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Repositories:
    Get.lazyPut<DatabaseContract>(() => FirestoreRepository());

    // Controllers:
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<TaskController>(() => TaskController(Get.find()), fenix: true);
  }
}
