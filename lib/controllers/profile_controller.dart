import 'package:get/get.dart';

class ProfileController extends GetxController {
  int selectedTab = 0;

  void changeTab(int index) {
    selectedTab = index;
    update();
  }
}