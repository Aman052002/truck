import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/common/background_image.dart';
import 'package:truck/constants/image_constants.dart';
import '../../../../common/cm.dart';
import '../../../../common/cw.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../language/string_constants.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                SizedBox(height: 6.px),
                CommonWidgets.appBarView(title: StringConstants.editProfile.tr),
                Divider(
                  thickness: 1.px,
                  color: Theme.of(context).colorScheme.surface.withAlpha(40),
                  indent: 5.px,
                  endIndent: 5.px,
                  height: 20.px,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 30.px),
                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            ImageConstants.imageAppLogo,
                            height: 100.px,
                            width: 100.px,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        keyboardType: TextInputType.name,
                        hintText: StringConstants.hintName.tr,
                        suffixIcon: CommonMethods.appIcons(
                          assetName: IconConstantsSvg.icOutlineProfile,
                          color: Theme.of(Get.context!).colorScheme.surface,
                        ),
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        keyboardType: TextInputType.number,
                        hintText: StringConstants.hintPhone.tr,
                        suffixIcon: CommonMethods.appIcons(
                          assetName: IconConstantsSvg.icCall,
                          color: Theme.of(Get.context!).colorScheme.surface,
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 16.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        keyboardType: TextInputType.emailAddress,
                        hintText: StringConstants.hintEmail.tr,
                        suffixIcon: CommonMethods.appIcons(
                          assetName: IconConstantsSvg.icEmail,
                          color: Theme.of(Get.context!).colorScheme.surface,
                        ),
                      ),
                      SizedBox(height: 70.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () {},
                        text: StringConstants.save.tr,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
