import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/image_constants.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;

  const BackgroundImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Get.isDarkMode
              ? ImageConstants.imageBackGroundDark
              : ImageConstants.imageBackGroundLight,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        child,
      ],
    );
  }
}
