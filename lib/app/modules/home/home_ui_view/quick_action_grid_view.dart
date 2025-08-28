import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/home/controllers/home_controller.dart';
import 'package:truck/common/cm.dart';

class QuickActionGridView extends StatelessWidget {
  final HomeController controller;
  const QuickActionGridView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.px,
        crossAxisSpacing: 16.px,
        childAspectRatio: 1.4,
      ),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 2.px),
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.listOfCards.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.px),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                offset: Offset(.1, .1),
                color: Theme.of(Get.context!).colorScheme.surface.withAlpha(50),
              ),
            ],
            color: Theme.of(Get.context!).scaffoldBackgroundColor,
          ),
          child: Column(
            spacing: 10.px,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonMethods.appIcons(
                assetName: controller.listOfCards[index]['icon'].toString(),
                height: 48.px,
                width: 48.px,
              ),
              Text(
                controller.listOfCards[index]['title'].toString(),
                style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
                  fontSize: 14.px,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
