import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app/routes/app_pages.dart';
import '../constants/icons_constant.dart';
import 'cm.dart';

class CommonWidgets {
  ///For Full Size Use In Column Not In ROW
  static Widget commonElevatedButton({
    double? height,
    double? width,
    EdgeInsetsGeometry? buttonMargin,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadius,
    Color? splashColor,
    bool wantContentSizeButton = false,
    Color? buttonColor,
    TextStyle? textStyle,
    double? elevation,
    Widget? child,
    TextStyle? style,
    required VoidCallback onPressed,
    required String text,
  }) {
    return Container(
      height: wantContentSizeButton ? height : 46.px,
      width: wantContentSizeButton ? width : double.infinity,
      margin: buttonMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.px),
        gradient: CommonMethods.commonLinearGradientView(),
      ),
      child: ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          onPressed(); // <-- Call the function
        },
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.px,
          padding: contentPadding,
          textStyle:
              textStyle ??
              Theme.of(
                Get.context!,
              ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.px),
          ),
          backgroundColor: buttonColor ?? Colors.transparent,
          foregroundColor: splashColor ?? Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child:
            child ??
            Text(
              text,
              textAlign: TextAlign.center,
              style:
                  style ??
                  Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.px,
                  ),
            ),
      ),
    );
  }

  static Widget commonTextFieldForLoginSignUP({
    double? elevation,
    String? hintText,
    String? labelText,
    String? errorText,
    String? title,
    TextStyle? titleStyle,
    EdgeInsetsGeometry? contentPadding,
    TextEditingController? controller,
    double? cursorHeight,
    bool wantBorder = false,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    Color? fillColor,
    Color? initialBorderColor,
    double? initialBorderWidth,
    TextInputType? keyboardType,
    double? borderRadius,
    double? borderWidth,
    double? maxHeight,
    TextStyle? hintStyle,
    TextStyle? style,
    TextStyle? labelStyle,
    TextStyle? errorStyle,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    bool autofocus = false,
    bool readOnly = false,
    bool hintTextColor = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    AutovalidateMode? autoValidateMode,
    int? maxLength,
    int? minLines = 1,
    int? maxLines = 1,
    GestureTapCallback? onTap,
    bool obscureText = false,
    bool leftPaddingIfWant = true,
    FocusNode? focusNode,
    MaxLengthEnforcement? maxLengthEnforcement,
    bool? filled,
    TextInputAction textInputAction = TextInputAction.next,
    TextAlign textAlign = TextAlign.start,
    AutovalidateMode? autovalidateMode,
    bool isCard = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: isCard
            ? CommonMethods.commonLinearGradientView()
            : CommonMethods.commonLinearGradientViewGrey(),
        borderRadius: BorderRadius.circular(borderRadius ?? 10.px),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(.2, .2),
            color: Theme.of(Get.context!).colorScheme.onSecondaryContainer,
          ),
        ],
        color: Theme.of(Get.context!).scaffoldBackgroundColor,
      ),
      child: Container(
        margin: EdgeInsets.all(borderWidth ?? .8.px),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.px),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: leftPaddingIfWant ? 14.px : 0.px),
          child: Theme(
            data: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Theme.of(Get.context!).primaryColor,
                selectionHandleColor: Theme.of(Get.context!).primaryColor,
                selectionColor: Theme.of(
                  Get.context!,
                ).primaryColor.withAlpha(40),
              ),
            ),
            child: TextFormField(
              focusNode: focusNode,
              textAlign: textAlign,
              maxLengthEnforcement: maxLengthEnforcement,
              minLines: minLines,
              maxLines: maxLines,
              obscureText: obscureText,
              onTap: onTap,
              maxLength: maxLength,
              obscuringCharacter: '●',
              cursorHeight: cursorHeight,
              cursorColor: Theme.of(Get.context!).primaryColor,
              autovalidateMode: autoValidateMode,
              controller: controller,
              textInputAction: textInputAction,
              onChanged:
                  onChanged ??
                  (value) {
                    value = value.trim();
                    if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
                      controller?.text = "";
                    }
                  },
              validator: validator,
              keyboardType: keyboardType ?? TextInputType.streetAddress,
              readOnly: readOnly,
              autofocus: autofocus,
              inputFormatters: inputFormatters,
              textCapitalization: textCapitalization,
              textAlignVertical: TextAlignVertical.center,
              style:
                  style ??
                  Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(Get.context!).colorScheme.surface,
                  ),
              decoration: InputDecoration(
                isDense: true,
                errorText: errorText,
                counterText: '',
                errorStyle:
                    errorStyle ??
                    Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                      color: Theme.of(Get.context!).colorScheme.error,
                    ),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                hintText: hintText,
                labelText: labelText,
                labelStyle: labelStyle,
                fillColor: fillColor ?? Theme.of(Get.context!).primaryColor,
                filled: filled,
                contentPadding:
                    contentPadding ?? EdgeInsets.symmetric(vertical: 14.px),
                hintStyle:
                    hintStyle ??
                    Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(Get.context!).colorScheme.surface,
                    ),
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget backIconBtnView({String? iconPath, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Container(
        width: 50.px,
        height: 50.px,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.px),
          border: Border.all(
            color: Theme.of(Get.context!).colorScheme.onSurface,
          ),
          color: Theme.of(Get.context!).colorScheme.onPrimary,
        ),
        child: Center(
          child: CommonMethods.appIcons(
            assetName: iconPath ?? IconConstantsSvg.icBack,
            height: 24.px,
            width: 24.px,
          ),
        ),
      ),
    );
  }

  static Widget commonOtpView({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    PinCodeFieldShape? shape,
    TextInputType keyboardType = TextInputType.number,
    List<TextInputFormatter>? inputFormatters,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onCompleted,
    int length = 6,
    double? height,
    double? width,
    double? borderRadius,
    double? borderWidth,
    bool readOnly = false,
    bool autoFocus = true,
    bool enableActiveFill = true,
    bool enablePinAutofill = true,
    bool autoDismissKeyboard = true,
    TextStyle? textStyle,
    Color? cursorColor,
    Color? inactiveColor,
    Color? inactiveFillColor,
    Color? activeColor,
    Color? activeFillColor,
    Color? selectedColor,
    Color? selectedFillColor,
    double? fontSize,
  }) => PinCodeTextField(
    length: length,
    mainAxisAlignment: mainAxisAlignment,
    appContext: Get.context!,
    cursorColor: cursorColor ?? Theme.of(Get.context!).primaryColor,
    autoFocus: autoFocus,
    keyboardType: keyboardType,
    inputFormatters:
        inputFormatters ??
        <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
    readOnly: readOnly,
    textStyle:
        textStyle ??
        Theme.of(
          Get.context!,
        ).textTheme.headlineMedium?.copyWith(fontSize: fontSize),
    autoDisposeControllers: false,
    enabled: true,
    animationType: AnimationType.fade,
    pinTheme: PinTheme(
      inactiveColor: Theme.of(Get.context!).colorScheme.onSecondaryContainer,
      inactiveFillColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      activeColor: Theme.of(Get.context!).colorScheme.onSecondaryContainer,
      activeFillColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      selectedColor: Theme.of(Get.context!).colorScheme.primary,
      selectedFillColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      shape: shape ?? PinCodeFieldShape.box,
      fieldWidth: width ?? 50.px,
      fieldHeight: height ?? 50.px,
      borderWidth: borderWidth ?? 2.px,
      borderRadius: BorderRadius.circular(borderRadius ?? 12.px),
    ),
    enableActiveFill: enableActiveFill,
    controller: controller,
    onChanged: onChanged,
    enablePinAutofill: enablePinAutofill,
    onCompleted: onCompleted,
    autoDismissKeyboard: autoDismissKeyboard,
  );

  static Widget appBarView({required String title}) {
    return Row(
      spacing: 10.px,
      children: [
        CommonWidgets.backIconBtnView(),
        Expanded(
          child: Text(
            title,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(Get.context!).colorScheme.onPrimaryContainer,
              fontSize: 18.px,
              height: .8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        CommonWidgets.backIconBtnView(
          iconPath: IconConstantsSvg.icNotification,
          onTap: () => Get.toNamed(Routes.NOTIFICATION),
        ),
      ],
    );
  }


}
