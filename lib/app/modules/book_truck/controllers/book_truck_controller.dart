import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/date_time_picker.dart';
import '../../../../helpers/location_helper.dart';

class BookTruckController extends GetxController {

  DateTime? startDateTime;

  final clientIsFalse = false.obs;
  FocusNode clientFocusNode = FocusNode();
  TextEditingController clientController = TextEditingController();

  final isAutoSelectDriveValue = false.obs;
  final driverIsFalse = false.obs;
  FocusNode driverFocusNode = FocusNode();
  TextEditingController driverController = TextEditingController();

  final tripStartLocationIsFalse = false.obs;
  FocusNode tripStartLocationFocusNode = FocusNode();
  TextEditingController tripStartLocationController = TextEditingController();
  final currentLocationLoadingValue = false.obs;

  FocusNode noteFocusNode = FocusNode();
  TextEditingController noteController = TextEditingController();

  TextEditingController dateTimeController = TextEditingController();


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


  void pickDateTime() {
    PickDateAndTime.pickDateTimeView(
      onChanged: (value) {},
      onConfirm: (value) {
        startDateTime = value.toUtc();
        dateTimeController.text = DateFormat('dd-MMM-yyyy hh:mm a').format(value);
      },
    );
  }

  Future<void> clickOnCurrentLocation() async {
    currentLocationLoadingValue.value = true;
    try{
      String? address = await LocationHelper.getCurrentLocationAddress();
      if (address != null) {
        tripStartLocationController.text = address;
      } else {
        Get.snackbar("Error", "Unable to fetch location");
      }
    }finally{
      currentLocationLoadingValue.value = false;
    }
  }

}
