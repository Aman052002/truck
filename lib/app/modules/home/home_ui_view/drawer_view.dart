import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/app/modules/home/controllers/home_controller.dart';

import '../../../../common/cm.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/image_constants.dart';
import '../../../../language/string_constants.dart';

class DrawerView extends StatelessWidget {
  final HomeController controller;

  const DrawerView({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 16.px, right: 8.px, top: 10.px),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  spacing: 6.px,
                  children: [
                    CircleAvatar(
                      radius: 30.px,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(ImageConstants.imageAppLogo),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.drawerTitle1.tr,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(
                                  context,
                                ).colorScheme.inversePrimary,
                                fontSize: 14.px,
                              ),
                        ),
                        Text(
                          StringConstants.drawerTitle2.tr,
                          style: Theme.of(Get.context!).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(
                                  Get.context!,
                                ).colorScheme.onPrimaryContainer,
                                fontSize: 12.px,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.px),
              ],
            ),
            SizedBox(height: 20.px),
            listTile(
              iconPath: IconConstantsSvg.icPerson,
              title: StringConstants.editProfile.tr,
              onTap: controller.clickOnEditProfile,
            ).paddingOnly(left: 4.px),
            listTile(
              iconPath: IconConstantsSvg.icPassword,
              title: StringConstants.changePassword.tr,
              onTap: controller.clickOnChangePassword,
            ),
            listTile(
              iconPath: IconConstantsSvg.icFeedback,
              title: StringConstants.feedback.tr,
              onTap: controller.clickOnFeedback,
            ),
            listTile(
              iconPath: IconConstantsSvg.icPrivacyPolicy,
              title: StringConstants.privacyPolicy.tr,
              onTap: controller.clickOnPrivacyPolicy,
            ),
            listTile(
              iconPath: IconConstantsSvg.icTermsAndConditions,
              title: StringConstants.termsAndConditions.tr,
              onTap: controller.clickOnTermsAndConditions,
            ),
            listTile(
              iconPath: IconConstantsSvg.icSupport,
              title: StringConstants.support.tr,
              onTap: controller.clickOnSupport,
            ),
            listTile(
              iconPath: IconConstantsSvg.icFAQ,
              title: StringConstants.faq.tr,
            ),
            listTile(
              iconPath: IconConstantsSvg.icSignOut,
              title: StringConstants.signOut.tr,
              onTap: controller.clickOnSignOut,
            ),
            SizedBox(height: 10.px),
            listTile(
              iconPath: IconConstantsSvg.icDeleteAccount,
              title: StringConstants.deleteAccount.tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget listTile({
    required String iconPath,
    required String title,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      leading: CommonMethods.appIcons(
        assetName: iconPath,
        color: title == StringConstants.deleteAccount.tr
            ? Theme.of(Get.context!).colorScheme.error
            : Theme.of(Get.context!).colorScheme.onPrimaryContainer,
      ),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 8,
      title: Text(
        title,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: title == StringConstants.deleteAccount.tr
              ? Theme.of(Get.context!).colorScheme.error
              : Theme.of(Get.context!).colorScheme.onPrimaryContainer,
          fontSize: 14.px,
        ),
      ),
      onTap: onTap,
    );
  }
}
