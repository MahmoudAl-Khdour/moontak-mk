import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/views/pages/sector_page/sector_page.dart';
import 'package:moontak/views/widgets/default_button_widget.dart';
import 'package:moontak/views/widgets/sign_widget.dart';
import 'package:moontak/views/widgets/text_filed_widget.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignWidget(
      pageTitle: 'Sign up',
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          // key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Information'.tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenBigWidget,
              ),
              Text(
                'Choose your address*'.tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
              ),
              TextFormFieldWidget(
                validator: (name) {},
                // controller: controller.phoneController,
                maxLength: 10,
                borderRadius: BorderRadius.circular(
                  AppDefaults.defaultLeftRadius,
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
                enabled: true,
                readOnly: false,
                autofocus: false,
                focusBorderColor: AppColors.appDefaultColor,
                textColor: AppColors.appDefaultColor,
                cursorColor: AppColors.appDefaultColor,
                filled: false,
                hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 13,
                    ),
                maxLines: 1,
                minLines: 1,
                borderWidth: 2,
                borderColors: AppColors.appBorderColor,
                pressablePrefix: false,
              ),
              SizedBox(
                height: AppDefaults.defaultHorizontalSpaceBetweenWidget,
              ),
              Text(
                'Facility Name*'.tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
              ),
              TextFormFieldWidget(
                validator: (name) {},
                // controller: controller.phoneController,
                maxLength: 10,
                borderRadius: BorderRadius.circular(
                  AppDefaults.defaultLeftRadius,
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
                enabled: true,
                readOnly: false,
                autofocus: false,
                focusBorderColor: AppColors.appDefaultColor,
                textColor: AppColors.appDefaultColor,
                cursorColor: AppColors.appDefaultColor,
                filled: false,
                hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 13,
                    ),
                maxLines: 1,
                minLines: 1,
                borderWidth: 2,
                borderColors: AppColors.appBorderColor,
                pressablePrefix: false,
              ),
              SizedBox(
                height: AppDefaults.defaultHorizontalSpaceBetweenWidget,
              ),
              Text(
                'Email*'.tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
              ),
              TextFormFieldWidget(
                validator: (name) {},
                // controller: controller.phoneController,
                maxLength: 10,
                borderRadius: BorderRadius.circular(
                  AppDefaults.defaultLeftRadius,
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
                enabled: true,
                readOnly: false,
                autofocus: false,
                focusBorderColor: AppColors.appDefaultColor,
                textColor: AppColors.appDefaultColor,
                cursorColor: AppColors.appDefaultColor,
                filled: false,
                hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 13,
                    ),
                maxLines: 1,
                minLines: 1,
                borderWidth: 2,
                borderColors: AppColors.appBorderColor,
                pressablePrefix: false,
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 1.5,
              ),
              DefaultButtonWidget(
                onTap: () {
                  Get.to(() => const SectorPage());
                },
                height: 50,
                radius: AppDefaults.defaultLeftRadius,
                text: 'Continue'.tr,
                background: AppColors.appBackgroundColor,
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenWidget,
              ),
              DefaultButtonWidget(
                onTap: () {
                  Get.back();
                },
                height: 50,
                radius: AppDefaults.defaultLeftRadius,
                text: 'Back'.tr,
                background: AppColors.appBackgroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
