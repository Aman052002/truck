import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:truck/theme/theme_data.dart';
import 'app/routes/app_pages.dart';
import 'language/language_translations.dart';

// final isEN = 'fr'.obs;
final isEN = 'en'.obs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    // ThemeMode themeMode = (await ConstPreferences.getTheme() ?? false)
    //     ? ThemeMode.dark
    //     : ThemeMode.light;
    runApp(MyApp(themeMode: ThemeMode.light));
  });
}

class MyApp extends StatelessWidget {
  ThemeMode themeMode;

  MyApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarIconBrightness:
      // UserDataSingleTon.instance.statusBarIconBrightness.value,
      // statusBarBrightness: UserDataSingleTon.instance.statusBarBrightness.value,
    ));
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SpinKitFadingCircle(
              color: Color(0xff1F8BE6),
              size: 50.0,
            ),
          ),
        );
      },
      child: GetMaterialApp(
        title: "Truck",
        translations: LanguageTranslations(),
        locale: const Locale("en", "US"),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.themeData(fontFamily: 'Raleway'),
        darkTheme: AppThemeData.themeData(fontFamily: 'Raleway', lightTheme: false),
      ),
    );
  }
}
