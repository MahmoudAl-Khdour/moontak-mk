import 'package:flutter/material.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_images.dart';
import 'package:moontak/constants/app_sizes.dart';

/// Sign widget base widget for sign pages like SignIn & SignUp

class SignWidget extends StatelessWidget {
  SignWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppDefaults.defaultHorizontalSpaceBetweenWidget,
                right: AppDefaults.defaultHorizontalSpaceBetweenWidget,
              ),
              child: Column(
                children: [
                  AppBar(
                    centerTitle: true,
                    backgroundColor: AppColors.appBackgroundColor,
                    title: Text(
                      'Title',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 23,
                                color: AppColors.appWhiteColor,
                              ),
                    ),
                    actions: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: AppColors.appDefaultColor,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 0.3,
                            color: AppColors.appWhiteColor!,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.appWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDefaults.defaultHorizontalSpaceBetweenWidget,
                  ),
                ],
              ),
            ),
            const Image(
              opacity: AlwaysStoppedAnimation(.4),
              image: AssetImage(
                AppImages.icon1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
