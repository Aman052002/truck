import 'package:get/get.dart';

import '../controllers/trip_management_controller.dart';

class TripManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripManagementController>(
      () => TripManagementController(),
    );
  }
}
