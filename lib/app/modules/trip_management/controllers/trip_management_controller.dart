import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck/common/cm.dart';
import 'package:truck/common/cw.dart';
import 'package:truck/language/string_constants.dart';

class TripManagementController extends GetxController {

  final tabBarSelectedValue = Get.parameters['tabValue'].obs;

  FocusNode clientFocusNode = FocusNode();
  TextEditingController clientController = TextEditingController();

  FocusNode truckFocusNode = FocusNode();
  TextEditingController truckController = TextEditingController();

  FocusNode tripDateFocusNode = FocusNode();
  TextEditingController tripDateController = TextEditingController();

  FocusNode departureTimeFocusNode = FocusNode();
  TextEditingController departureTimeController = TextEditingController();

  FocusNode gPSCoordinatesFocusNode = FocusNode();
  TextEditingController gPSCoordinatesController = TextEditingController();

  FocusNode kmToDestinationFocusNode = FocusNode();
  TextEditingController kmToDestinationController = TextEditingController();

  FocusNode arrivalTimeFocusNode = FocusNode();
  TextEditingController arrivalTimeController = TextEditingController();

  FocusNode arrivalGPSCoordinatesFocusNode = FocusNode();
  TextEditingController arrivalGPSCoordinatesController = TextEditingController();

  FocusNode startTimeFocusNode = FocusNode();
  TextEditingController startTimeController = TextEditingController();

  FocusNode endTimeFocusNode = FocusNode();
  TextEditingController endTimeController = TextEditingController();

  final startTripValue = false.obs;
  final markArrivalValue = false.obs;
  final unloadValue = false.obs;

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

  void clickOnStartTrip() {
    if(clientController.text.isNotEmpty) {
      startTripValue.value = true;
    }
    else{
      CommonMethods.commonErrorToast(StringConstants.pleaseSelectAClientBeforeProceeding.tr);
    }
  }

  void clickOnMarkArrivalBtn() {
    markArrivalValue.value = true;
  }

  void clickOnUnloadBtn() {
    unloadValue.value = true;
  }

}
