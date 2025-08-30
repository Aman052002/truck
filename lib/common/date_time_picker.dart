import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';

class PickDateAndTime {


  // Assuming you have a method where you want to show this picker
// For example, in a StatelessWidget or StatefulWidget, or a GetX controller
  static Future<DateTime?> pickDateTimeView({
    DateTime? minDateTime, // Changed parameter name to avoid conflict with local var
    DateTime? maxDateTime, // Added maxDateTime parameter
    required Function(DateTime) onChanged,
    required Function(DateTime) onConfirm,
  }) {
    // Determine the actual minTime for the picker
    // If minDateTime is provided, use it. Otherwise, default to now.
    final DateTime actualMinTime = minDateTime ?? DateTime.now();

    // Determine the actual maxTime for the picker
    // If maxDateTime is provided, use it.
    // Otherwise, default to 5 years from the current time.
    final DateTime actualMaxTime = maxDateTime ??
        DateTime(
          DateTime.now().year + 5,
          DateTime.now().month,
          DateTime.now().day,
          23, // Set to end of day for a full 5 years range by default
          59, // Set to end of day
          59, // Set to end of day
        );

    // Ensure currentTime is within the min/max bounds
    // If current time is before minTime, set it to minTime.
    // If current time is after maxTime, set it to maxTime.
    DateTime initialCurrentTime = DateTime.now();
    if (initialCurrentTime.isBefore(actualMinTime)) {
      initialCurrentTime = actualMinTime;
    } else if (initialCurrentTime.isAfter(actualMaxTime)) {
      initialCurrentTime = actualMaxTime;
    }


    return DatePicker.showDateTimePicker(
      Get.context!, // Make sure Get.context is available or pass context
      showTitleActions: true,
      onCancel: () => Get.back(),
      minTime: actualMinTime, // Use the determined min time
      maxTime: actualMaxTime, // Use the determined max time
      onChanged: onChanged,
      onConfirm: onConfirm,
      currentTime: initialCurrentTime, // Use the adjusted current time
      locale: LocaleType.en, // Or LocaleType.zh, LocaleType.es, etc.
    );
  }


}