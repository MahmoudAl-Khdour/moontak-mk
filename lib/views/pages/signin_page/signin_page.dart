import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_images.dart';
import 'package:moontak/controllers/signin_controller.dart';
import 'package:moontak/views/dialogs/custom_toast.dart';
import 'package:moontak/views/pages/otp_page/otp_page.dart';
import 'package:moontak/views/pages/signup_page/signup_page.dart';
import 'package:moontak/views/widgets/default_button_widget.dart';
import 'package:moontak/views/widgets/sign_widget.dart';
import 'package:moontak/views/widgets/text_filed_widget.dart';

class SignInPage extends GetWidget<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignWidget(
      pageTitle: 'Sign in',
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenWidget,
              ),
              TextFormFieldWidget(
                validator: (phone) {
                  if (phone == null || phone.isEmpty) {
                    return 'Phone number is required'.tr;
                  } else if (phone.length > 10 || phone.length < 10) {
                    return 'Phone number must be 10 digits e.g. 07********';
                  }
                  return null;
                },
                controller: controller.phoneController,
                maxLength: 10,
                borderRadius: BorderRadius.circular(
                  AppDefaults.defaultLeftRadius,
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                isPassword: false,
                enabled: true,
                readOnly: false,
                autofocus: false,
                focusBorderColor: AppColors.appDefaultColor,
                textColor: AppColors.appDefaultColor,
                cursorColor: AppColors.appDefaultColor,
                hint: '+962'.tr,
                filled: false,
                hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 13,
                    ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: AppColors.appTealColor,
                      borderRadius: BorderRadius.circular(
                        AppDefaults.defaultRightRadius,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Image(
                            height: 35,
                            width: 35,
                            image: AssetImage(
                              AppImages.jordanIcon,
                            )),
                      ),
                    ),
                  ),
                ),
                maxLines: 1,
                minLines: 1,
                borderWidth: 2,
                borderColors: AppColors.appBorderColor,
                pressablePrefix: false,
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
              ),
              Text(
                'We will send you a code to verify the information'.tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor.withOpacity(0.4),
                      fontSize: 13,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 1.5,
              ),
              DefaultButtonWidget(
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    Get.to(
                        OTPPage(phoneNumber: controller.phoneController.text));
                  } else {
                    CustomToast.requiredField();
                  }
                },
                height: 50,
                radius: AppDefaults.defaultLeftRadius,
                text: 'Continue'.tr,
                background: AppColors.appBackgroundColor,
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 1.5,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'You do not have an account ?'.tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.appBackgroundColor,
                        fontSize: 13,
                      ),
                ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 1.5,
              ),
              DefaultButtonWidget(
                onTap: () {
                  Get.off(() => const SignUpPage());
                },
                height: 50,
                radius: AppDefaults.defaultLeftRadius,
                text: 'Create a new account'.tr,
                textColor: AppColors.appBackgroundColor,
                background: AppColors.appWhiteColor!,
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenWidget,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do you need help ?'.tr,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.appBackgroundColor,
                          fontSize: 11,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Contact technical support'.tr,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.appBackgroundColor,
                            fontSize: 11,
                          ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
