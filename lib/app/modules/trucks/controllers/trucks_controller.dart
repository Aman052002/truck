import 'package:get/get.dart';
import 'package:truck/app/routes/app_pages.dart';

class TrucksController extends GetxController {

  final RxnString selectedFilterValue = RxnString('All');

  List<String> filterList = ['All','Available','On Trip','Maintenance'];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clickOnBookTruckBtn() {
    Get.toNamed(Routes.BOOK_TRUCK);
  }

}
