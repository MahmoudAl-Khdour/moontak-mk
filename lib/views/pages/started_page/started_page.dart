import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moontak/constants/app_images.dart';
import 'package:moontak/constants/app_sizes.dart';
import 'package:moontak/views/pages/boarding_page/boarding_page.dart';
import 'package:moontak/views/widgets/base_widget.dart';

import '../../../data/providers/cache_utils.dart';
import '../language_page/language_page.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({super.key});

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  Widget checkInitialPage() {
    final cacheUtils = Get.put(CacheUtils(GetStorage()), permanent: true);
    if (!(cacheUtils.getOnBoarding() ?? true)) {
      return const OnBoardingPage();
    } else if (cacheUtils.isUserLoggedIn()) {
      return const BaseWidget();
    } else {
      return const LanguagePage();
    }
  }

  void initialization() async {
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');

    Get.offAll(() => checkInitialPage());
  }

  @override
  void initState() {
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return Container(
      height: AppSizeConfig.screenHeight,
      width: AppSizeConfig.screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            AppImages.moontakSplash,
          ),
        ),
      ),
    );
  }
}
