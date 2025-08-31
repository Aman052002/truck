import 'package:get/get.dart';
import 'package:truck/language/string_constants.dart';
class ExpenseController extends GetxController {

  final tabBarSelectedValue = Get.parameters['tabValue'].obs;

  final selectedExpenseTypeValue = StringConstants.fuel.tr.obs;

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

}
