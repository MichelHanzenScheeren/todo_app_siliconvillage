import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/data/repositories/firestore_repository.dart';
import 'package:todo_app_siliconvillage/domain/contracts/database_contract.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Repositories:
    Get.lazyPut<DatabaseContract>(() => FirestoreRepository());
  }
}
