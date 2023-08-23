import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/controllers/sector_controller.dart';
import 'package:moontak/views/pages/address_page/address_page.dart';
import 'package:moontak/views/widgets/default_button_widget.dart';
import 'package:moontak/views/widgets/drop_down_widget.dart';
import 'package:moontak/views/widgets/sign_widget.dart';

class SectorPage extends GetWidget<SectorController> {
  const SectorPage({super.key});

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
                'Sector'.tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenBigWidget,
              ),
              Text(
                'Sector type'.tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
              ),
              DropDownWidget(
                focusNode: controller.sectorTypeFocusNode,
                borderWidth: 2.0,
                icon: null,
                iconColor: AppColors.appDefaultColor,
                borderColorWhenOpen: AppColors.appDefaultColor,
                borderColorWhenClose: AppColors.appBorderColor,
                dropdownValue: controller.dropdownValueSectorType.value,
                items: const [
                  'Horeca',
                  'Test',
                ],
                onChange: (String? value) {},
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenBigWidget,
              ),
              Text(
                'Horeca type'.tr,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.appBackgroundColor,
                    ),
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
              ),
              DropDownWidget(
                focusNode: controller.sectorTypeFocusNode,
                borderWidth: 2.0,
                icon: null,
                iconColor: AppColors.appDefaultColor,
                borderColorWhenOpen: AppColors.appDefaultColor,
                borderColorWhenClose: AppColors.appBorderColor,
                dropdownValue: controller.dropdownValueSectorType.value,
                items: const [
                  'Horeca',
                  'Test',
                ],
                onChange: (String? value) {},
              ),
              SizedBox(
                height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 1.5,
              ),
              DefaultButtonWidget(
                onTap: () {
                  Get.to(() => const AddressPage());
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
