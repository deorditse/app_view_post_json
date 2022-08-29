import 'package:get/get.dart';

class ImplementSettingGetXController extends GetxController {
  Rx<int> currentTabIndex = 0.obs;

  bool switchChangeTheme = Get.isDarkMode;

  void changeTheme({required bool bolSwitch}) {
    switchChangeTheme = bolSwitch;
    update();
  }
}
