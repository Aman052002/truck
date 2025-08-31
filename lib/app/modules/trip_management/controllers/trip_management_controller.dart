import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
