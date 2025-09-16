import 'package:get/get.dart';

import '../controllers/addtruck_controller.dart';

class AddtruckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddtruckController>(
      () => AddtruckController(),
    );
  }
}
