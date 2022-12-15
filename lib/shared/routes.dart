import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/presentation/screens/home/home_screen.dart';
import 'package:todo_app_siliconvillage/presentation/screens/task/task_screen.dart';

class AppRoutes {
  static const homeScreen = '/';
  static const taskScreen = '/task';
  static List<GetPage> pages() {
    return [
      GetPage(page: () => HomeScreen(), name: homeScreen),
      GetPage(page: () => TaskScreen(), name: taskScreen),
    ];
  }
}
