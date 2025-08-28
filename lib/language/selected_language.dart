import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/common/cw.dart';

class SelectedLanguagePage extends StatelessWidget {
  String? isEn;
  final Function(String value) changeLanguage;
  final VoidCallback onPressed;
  final count = 0.obs;

  SelectedLanguagePage({
    super.key,
    required this.isEn,
    required this.changeLanguage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      count.value;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.px, vertical: 20.px),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              changeLanguageTextView(),
              SizedBox(height: 16.px),
              englishCardView(),
              SizedBox(height: 5.px),
              hindiCardView(),
              SizedBox(height: 5.px),
              frenchCardView(),
              SizedBox(height: 16.px),
              Row(
                children: [
                  Expanded(
                    child: backButtonView(),
                  ),
                  SizedBox(width: 10.px),
                  Expanded(
                    child: saveLanguageButtonView(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget changeLanguageTextView() => Text(
    'Change Language',
    style: Theme.of(Get.context!).textTheme.displaySmall?.copyWith(
      fontSize: 18.px,
      fontWeight: FontWeight.w700,
    ),
  );

  Widget englishCardView() => SelectedCard(
    showImage: true,
    imagePath: "assets/images/wxr.png",
    selected: isEn == "en",
    // textTitle: PageConstVar.english.tr,
    textTitle: "English",
    onPressed: () {
      changeLanguage("en");
    },
  );

  Widget hindiCardView() => SelectedCard(
    showImage: true,
    imagePath: "assets/images/converted.png",
    selected: isEn == "hi",
    textTitle: "Hindi",
    onPressed: () {
      changeLanguage("hi");
    },
  );

  Widget frenchCardView() => SelectedCard(
    showImage: true,
    imagePath: "assets/images/converted.png",
    selected: isEn == "fr",
    textTitle: "French",
    onPressed: () {
      changeLanguage("fr");
    },
  );

  Widget backButtonView() => CommonWidgets.backIconBtnView();

  Widget saveLanguageButtonView() => CommonWidgets.commonElevatedButton(
      onPressed: () {
        if (isEn == "en") {
          var local = const Locale("en", "US");
          Get.updateLocale(local);
        }
        else if(isEn == "fr" ){
          var local = const Locale("fr", "FR");
          Get.updateLocale(local);
        }
        else {
          var local = const Locale("hi", "IN");
          Get.updateLocale(local);
        }
        Get.back();
      },
      text: 'Save',
  );
}

class SelectedCard extends StatelessWidget {
  const SelectedCard(
      {super.key,
        required this.imagePath,
        required this.textTitle,
        required this.selected,
        required this.showImage,
        required this.onPressed});
  final String imagePath;
  final String textTitle;
  final bool selected;

  final bool showImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Stack(
        children: [
          if (showImage == true)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 6.px),
                child: imageView(),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(6.px),
            child: buttonView(),
          ),
          if (selected)
            selectedIconView()
        ],
      ),
    );
  }

  Widget imageView() => Image.asset(
    imagePath,
    height: 60.px,
    width: MediaQuery.of(Get.context!).size.width * 0.7,
    alignment: Alignment.bottomCenter,
    color: selected
        ? Theme.of(Get.context!).colorScheme.primary
        : Theme.of(Get.context!).colorScheme.surface,
  );

  Widget buttonView() => OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 100.px),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
        side: BorderSide(
            width: selected
                ? 1.5.px
                : .5.px,
            color: selected
                ? Theme.of(Get.context!).colorScheme.primary
                : Theme.of(Get.context!).colorScheme.surface),
        backgroundColor: selected
            ? Theme.of(Get.context!).colorScheme.primary.withOpacity(.02)
            : Theme.of(Get.context!).colorScheme.surface.withOpacity(.02)
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
              color: selected
                  ? Theme.of(Get.context!).colorScheme.primary
                  : null,
              fontWeight: selected
                  ? FontWeight.w700
                  : FontWeight.w500
          ),
        ),
      ],
    ),
  );

  Widget selectedIconView() => Align(
    alignment: Alignment.topRight,
    child: Container(
      width: 20.px,
      height: 20.px,
      decoration: BoxDecoration(
          color: Theme.of(Get.context!).colorScheme.primary,
          shape: BoxShape.circle),
      child: Center(
        child: Icon(
          Icons.verified,
          size: 16.px,
          color: Theme.of(Get.context!).colorScheme.inversePrimary,
        ),
      ),
    ),
  );

}