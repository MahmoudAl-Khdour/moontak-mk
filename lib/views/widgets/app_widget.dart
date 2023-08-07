import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moontak/bindings/app_bindings.dart';
import 'package:moontak/constants/app_translation.dart';
import 'package:moontak/views/pages/boarding_page/boarding_page.dart';
import 'package:moontak/views/pages/signin_page/sign_page.dart';
import 'package:moontak/views/themes/light_theme.dart';
import 'package:moontak/views/widgets/base_widget.dart';

import '../../data/providers/cache_utils.dart';

class MoontakApp extends StatefulWidget {
  const MoontakApp({super.key});

  @override
  State<MoontakApp> createState() => _MyAppState();
}

class _MyAppState extends State<MoontakApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moontak'.tr,
      theme: lightTheme,
      initialBinding: AppBindings(),
      translations: AppTranslation(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      home: const OnBoardingPage(),
    );
  }
}

Widget checkInitialPage() {
  final cacheUtils = Get.put(CacheUtils(GetStorage()), permanent: true);
  if (!(cacheUtils.getOnBoarding() ?? true)) {
    return const OnBoardingPage();
  } else if (cacheUtils.isUserLoggedIn()) {
    return const BaseWidget();
  } else {
    return const SignInPage();
  }
}
