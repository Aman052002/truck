import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonMethods {
  static LinearGradient commonLinearGradientView() => LinearGradient(
    end: Alignment.centerRight,
    begin: Alignment.centerLeft,
    colors: [
      Theme.of(Get.context!).colorScheme.secondary,
      Theme.of(Get.context!).colorScheme.primary,
    ],
  );

  static LinearGradient commonLinearGradientViewGrey() => LinearGradient(
    end: Alignment.centerLeft,
    begin: Alignment.centerRight,
    colors: [
      Theme.of(Get.context!).colorScheme.onSecondaryContainer,
      Theme.of(Get.context!).colorScheme.onSecondaryContainer,
    ],
  );

  static LinearGradient commonLinearGradientViewDarkGrey() => LinearGradient(
    end: Alignment.centerLeft,
    begin: Alignment.centerRight,
    colors: [Color(0xff000000), Color(0xff000000)],
  );

  static Widget appIcons({
    required String assetName,
    double? width,
    double? height,
    Color? color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetName,
          height: height ?? 24.px,
          width: width ?? 24.px,
          color: color,
        ),
      ],
    );
  }

  static Widget textViewLinearGradient({
    String? text,
    bool? value,
    TextStyle? style,
  }) => Center(
    child: GradientWidget(
      text: text,
      style:
          style ??
          Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            fontSize: 12.px,
            fontWeight: FontWeight.w600,
          ),
      gradient: value ?? true
          ? commonLinearGradientView()
          : commonLinearGradientViewDarkGrey(),
    ),
  );

  static Widget iconLinearGradient({
    required String assetName,
    double? width,
    double? height,
    bool? value,
  }) => Center(
    child: GradientWidget(
      gradient: value ?? true
          ? commonLinearGradientView()
          : commonLinearGradientViewDarkGrey(),
      child: appIcons(assetName: assetName, width: width, height: height),
    ),
  );
}

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    this.text,
    required this.gradient,
    this.style,
    this.child,
  });

  final String? text;
  final TextStyle? style;
  final Widget? child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child ?? Text(text ?? '', style: style),
    );
  }
}
