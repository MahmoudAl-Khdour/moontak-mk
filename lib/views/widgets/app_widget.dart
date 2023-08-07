import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:moontak/bindings/app_bindings.dart';
import 'package:moontak/constants/app_translation.dart';
import 'package:moontak/views/pages/started_page/started_page.dart';
import 'package:moontak/views/themes/light_theme.dart';

class MoontakApp extends StatefulWidget {
  const MoontakApp({super.key});

  @override
  State<MoontakApp> createState() => _MyAppState();
}

class _MyAppState extends State<MoontakApp> {
  init() async {
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moontak'.tr,
      theme: lightTheme,
      initialBinding: AppBindings(),
      translations: AppTranslation(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      home: const StartedPage(),
    );
  }
}
