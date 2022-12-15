import 'package:get/get.dart';
import 'package:todo_app_siliconvillage/presentation/screens/home_screen.dart';

class AppRoutes {
  static const homeScreen = '/';
  static List<GetPage> pages() {
    return [
      GetPage(page: () => HomeScreen(), name: homeScreen),
    ];
  }
}
