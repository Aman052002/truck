import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck/app/routes/app_pages.dart';
import 'package:truck/constants/icons_constant.dart';
import 'package:truck/language/string_constants.dart';

import '../../../../dialogs/sign_out_dialog_view.dart';
import '../../../../language/selected_language.dart';
import '../../../../main.dart';

class HomeController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  final isPassword = false.obs;
  final isPasswordShow = true.obs;

  List<Map<String, String>> listOfCards =[
    {
      "icon": IconConstantsSvg.icNewTrip,
      "title": StringConstants.newTrip.tr,
    },
    {
      "icon": IconConstantsSvg.icMyTrips,
      "title": StringConstants.myTrips.tr,
    },
    {
      "icon": IconConstantsSvg.icExpenses,
      "title": StringConstants.expenses.tr,
    },
    {
      "icon": IconConstantsSvg.icMaintenance,
      "title": StringConstants.maintenance.tr,
    }
  ];


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


  void clickOnChangeLanguage() {
    if(Get.locale?.languageCode == 'hi'){
      isEN.value = 'hi';
    }
    else if(Get.locale?.languageCode == 'fr'){
      isEN.value = 'fr';
    }
    else{
      isEN.value = 'en';
    }
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      isDismissible: false,
      builder: (BuildContext context) {
        return Obx((){
          return SelectedLanguagePage(
            isEn: isEN.value,
            changeLanguage: (String value) => isEN.value = value,
            onPressed: () {},
          );
        },
        );
      },
    );
  }

  void closeDrawer(){
    scaffoldKey.currentState?.closeDrawer();
  }

  void clickOnEditProfile(){
    closeDrawer();
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  void clickOnChangePassword(){
    closeDrawer();
    Get.toNamed(Routes.CHANGE_PASSWORD);
  }

  void clickOnFeedback(){
    closeDrawer();
    Get.toNamed(Routes.FEEDBACK);
  }

  void clickOnPrivacyPolicy(){
    closeDrawer();
    Get.toNamed(Routes.PRIVACY_POLICY);
  }

  void clickOnTermsAndConditions(){
    closeDrawer();
    Get.toNamed(Routes.TERMS_AND_CONDITIONS);
  }

  void clickOnSupport(){
    closeDrawer();
    Get.toNamed(Routes.SUPPORT);
  }

  void clickOnFAQ(){}

  void clickOnSignOut(){
    showCupertinoDialog(
      context: Get.context!,
      builder: (context) => LogoutDialog(
        onConfirm: () => Get.offAllNamed(Routes.LOGIN),
      ),
    );
  }

  void clickOnDeleteAccount(){}

}
