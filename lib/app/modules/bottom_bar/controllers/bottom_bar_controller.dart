import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:truck/app/modules/clients/controllers/clients_controller.dart';
import 'package:truck/app/modules/drivers/controllers/drivers_controller.dart';
import 'package:truck/app/modules/home/controllers/home_controller.dart';
import 'package:truck/app/modules/reports/controllers/reports_controller.dart';
import 'package:truck/app/modules/trucks/controllers/trucks_controller.dart';

import '../../../../dialogs/exit_app_dialog_view.dart';

class BottomBarController extends GetxController {

  final activeIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TrucksController());
    Get.lazyPut(() => DriversController());
    Get.lazyPut(() => ClientsController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onWillPop(){
    if(activeIndex.value == 0) {
      showCupertinoDialog(
      context: Get.context!,
      builder: (_) => ExitAppDialog(),
     );
    }else{
      activeIndex.value = 0;
    }
  }

}
