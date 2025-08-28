import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/language/string_constants.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        StringConstants.logOut.tr,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
          fontSize: 18.px,
        ),
      ),
      content: Text(
        StringConstants.logOutDetails.tr,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
          fontSize: 12.px,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            StringConstants.cancel.tr,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(Get.context!).colorScheme.primary,
              fontSize: 14.px,
            ),
          ),
          onPressed: () => Get.back(),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: Text(
            StringConstants.logOut.tr,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(Get.context!).colorScheme.error,
              fontSize: 14.px,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
        ),
      ],
    );
  }
}
