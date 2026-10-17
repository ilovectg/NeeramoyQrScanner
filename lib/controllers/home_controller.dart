import 'package:get/get.dart';

class HomeController extends GetxController {
  int current = 0;
  int selectedIndex = 0;

  void increment() {
    current++;
    update();
  }

  void changeTabIndex(int index) {
    selectedIndex = index;
    update();
  }
}