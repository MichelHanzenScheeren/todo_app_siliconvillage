import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/domain/contracts/database_contract.dart';

class TaskController extends GetxController {
  final DatabaseContract database;

  TaskController(this.database);
}
