import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_images.dart';
import 'package:moontak/constants/app_sizes.dart';

/// Sign widget base widget for sign pages like SignIn & SignUp

class SignWidget extends StatelessWidget {
  String pageTitle;
  Widget body;

  SignWidget({
    Key? key,
    required this.pageTitle,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Container(
        height: AppSizeConfig.screenHeight,
        width: AppSizeConfig.screenWidth,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.background,
                ))),
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            left: AppDefaults.defaultHorizontalSpaceBetweenWidget,
            right: AppDefaults.defaultHorizontalSpaceBetweenWidget,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent, // 1
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: Center(
                      child: Icon(
                        size: 35,
                        Icons.arrow_circle_left_outlined,
                        color: AppColors.appWhiteColor,
                      ),
                    ),
                  ),
                  title: Text(
                    pageTitle.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 23,
                          color: AppColors.appWhiteColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: AppDefaults.defaultHorizontalSpaceBetweenWidget,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Welcome \n'.tr,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 16,
                        ),
                    children: [
                      TextSpan(
                        text: pageTitle.tr,
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 25,
                                  color: AppColors.appWhiteColor,
                                ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenBigWidget,
                ),
                Container(
                  width: AppSizeConfig.screenWidth,
                  height: AppSizeConfig.screenHeight * 0.68,
                  decoration: BoxDecoration(
                    color: AppColors.appWhiteColor,
                    borderRadius:
                        BorderRadius.circular(AppDefaults.defaultLeftRadius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDefaults.defaultTopPadding * 2,
                      horizontal:
                          AppDefaults.defaultVerticalSpaceBetweenBigWidget,
                    ),
                    child: body,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
