import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_images.dart';
import 'package:moontak/constants/app_sizes.dart';
import 'package:moontak/views/pages/home_page/home_page.dart';
import 'package:moontak/views/widgets/default_button_widget.dart';

class OTPPage extends StatelessWidget {
  String phoneNumber;
  OTPPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.appWhiteColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: AppSizeConfig.screenHeight,
            width: AppSizeConfig.screenWidth,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  height: AppSizeConfig.screenHeight * 0.4,
                  opacity: const AlwaysStoppedAnimation(.6),
                  image: const AssetImage(
                    AppImages.icon1,
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image(
                        width: AppSizeConfig.screenWidth,
                        opacity: const AlwaysStoppedAnimation(.6),
                        image: const AssetImage(
                          AppImages.icon2,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppDefaults.defaultHorizontalSpaceBetweenWidget,
                        right: AppDefaults.defaultHorizontalSpaceBetweenWidget,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                  color: AppColors.appBackgroundColor,
                                ),
                              ),
                            ),
                            title: Text(
                              'One time password'.tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 20,
                                    color: AppColors.appBackgroundColor,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: AppSizeConfig.screenWidth * 0.4,
                          ),
                          Text(
                            'Verification Code'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 18,
                                  color: AppColors.appBackgroundColor,
                                ),
                          ),
                          SizedBox(
                            height: AppDefaults
                                .defaultVerticalSpaceBetweenBigWidget,
                          ),
                          Text(
                            'We have sent you a verification code via your phone number'
                                .tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 16,
                                  color: AppColors.appBackgroundColor
                                      .withOpacity(0.6),
                                ),
                          ),
                          SizedBox(
                            height: AppDefaults
                                .defaultVerticalSpaceBetweenBigWidget,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                phoneNumber,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.appBackgroundColor,
                                    ),
                              ),
                              SizedBox(
                                width: AppDefaults
                                        .defaultHorizontalSpaceBetweenSmallWidget *
                                    2,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.appBackgroundColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.edit,
                                      color: AppColors.appWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppDefaults
                                .defaultVerticalSpaceBetweenBigWidget,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppDefaults
                                        .defaultHorizontalSpaceBetweenWidget *
                                    2,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.appWhiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            0,
                                            3,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            3,
                                            0,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            0,
                                            -3,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            -3,
                                            0,
                                          ),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Center(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppDefaults
                                        .defaultVerticalSpaceBetweenWidget,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.appWhiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            0,
                                            3,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            3,
                                            0,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            0,
                                            -3,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            -3,
                                            0,
                                          ),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Center(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppDefaults
                                        .defaultVerticalSpaceBetweenWidget,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.appWhiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            0,
                                            3,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            3,
                                            0,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            0,
                                            -3,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            -3,
                                            0,
                                          ),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Center(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppDefaults
                                        .defaultVerticalSpaceBetweenWidget,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.appWhiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            0,
                                            3,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            3,
                                            0,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            0,
                                            -3,
                                          ),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(
                                            -3,
                                            0,
                                          ),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Center(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 1,
                                        decoration: InputDecoration(
                                          counter: Offstage(),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: AppSizeConfig.screenHeight * 0.1,
                          ),
                          DefaultButtonWidget(
                            onTap: () {
                              Get.offAll(() => const HomePage());
                            },
                            height: 50,
                            radius: AppDefaults.defaultLeftRadius,
                            text: 'Send'.tr,
                            background: AppColors.appBackgroundColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
