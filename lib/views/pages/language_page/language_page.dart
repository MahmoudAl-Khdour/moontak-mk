import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_images.dart';
import 'package:moontak/constants/app_sizes.dart';
import 'package:moontak/controllers/language_controller.dart';
import 'package:moontak/views/widgets/default_button_widget.dart';
import 'package:moontak/views/widgets/language_item.dart';
import 'package:moontak/views/widgets/sign_widget.dart';

class LanguagePage extends GetWidget<LanguageController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.appWhiteColor,
      body: SizedBox(
        height: AppSizeConfig.screenHeight,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: AppDefaults.defaultTopPadding,
            left: AppDefaults.defaultLeftPadding,
            right: AppDefaults.defaultRightPadding,
            bottom: AppDefaults.defaultBottomPadding,
          ),
          children: [
            const Center(
              child: Image(
                height: 300,
                image: AssetImage(
                  AppImages.moontakLogo,
                ),
              ),
            ),
            SizedBox(
              height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
            ),
            Text(
              'Welcome to moontak'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
            SizedBox(
              height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget * 2,
            ),
            Text(
              'Which language do you prefer?'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.appDefaultColor,
                    fontSize: 18,
                  ),
            ),
            SizedBox(
              height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 2,
            ),
            LanguageItem(
              onTap: () {
                Get.updateLocale(const Locale('ar'));
                controller.languageIsArabic.value = true;
                controller.languageIsEnglish.value = false;
              },
              activeLanguage: controller.languageIsArabic.value,
              icon: Icons.done,
              languageName: 'عربي',
              countryImage: AppImages.jordanIcon,
            ),
            SizedBox(
              height: AppDefaults.defaultVerticalSpaceBetweenWidget,
            ),
            LanguageItem(
              onTap: () {
                Get.updateLocale(const Locale('en'));
                controller.languageIsArabic.value = false;
                controller.languageIsEnglish.value = true;
              },
              activeLanguage: controller.languageIsEnglish.value,
              icon: Icons.done,
              languageName: 'English',
              countryImage: AppImages.unitedIcon,
            ),
            SizedBox(
              height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 2,
            ),
            DefaultButtonWidget(
              onTap: () {
                Get.to(SignWidget());
              },
              height: 50,
              radius: AppDefaults.defaultLeftRadius,
              text: 'Continue'.tr,
              background: AppColors.appBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
