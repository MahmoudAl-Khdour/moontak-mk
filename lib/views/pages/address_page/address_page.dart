import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_sizes.dart';
import 'package:moontak/controllers/address_controller.dart';
import 'package:moontak/views/pages/location_page/location_page.dart';
import 'package:moontak/views/pages/otp_page/otp_page.dart';
import 'package:moontak/views/widgets/default_button_widget.dart';
import 'package:moontak/views/widgets/drop_down_widget.dart';
import 'package:moontak/views/widgets/sign_widget.dart';
import 'package:moontak/views/widgets/text_filed_widget.dart';

class AddressPage extends GetWidget<AddressController> {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignWidget(
      pageTitle: 'Sign up',
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          // key: controller.formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address'.tr,
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
                TextFormFieldWidget(
                  onTap: () async {
                    var p = await Get.to(() => const SearchPage());

                    if (p != null) {
                      controller.notifier.value = p as GeoPoint;

                      controller.getAddressFromLatLng(
                        longitude: controller.notifier.value!.longitude,
                        latitude: controller.notifier.value!.latitude,
                      );
                    }
                  },
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      return 'Phone number is required'.tr;
                    } else if (phone.length > 10 || phone.length < 10) {
                      return 'Phone number must be 10 digits e.g. 07********';
                    }
                    return null;
                  },
                  controller: controller.addressController,
                  maxLength: 10,
                  borderRadius: BorderRadius.circular(
                    AppDefaults.defaultLeftRadius,
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
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
                  suffixIcon: Icon(
                    Icons.gps_fixed,
                    color: AppColors.appBackgroundColor,
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
                  'Enter your address manually'.tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.appBackgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
                ),
                Text(
                  'Your city'.tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.appBackgroundColor,
                      ),
                ),
                SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
                ),
                TextFormFieldWidget(
                  onTap: () async {},
                  validator: (phone) {},
                  // controller: controller.addressController,
                  maxLength: 10,
                  borderRadius: BorderRadius.circular(
                    AppDefaults.defaultLeftRadius,
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  isPassword: false,
                  enabled: true,
                  readOnly: true,
                  autofocus: false,
                  focusBorderColor: AppColors.appDefaultColor,
                  textColor: AppColors.appDefaultColor,
                  cursorColor: AppColors.appDefaultColor,
                  filled: false,
                  hint: 'Amman'.tr,
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
                  height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
                ),
                Text(
                  'Your region'.tr,
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
                  height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                ),
                Text(
                  'Your address in detail'.tr,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.appBackgroundColor,
                      ),
                ),
                SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
                ),
                TextFormFieldWidget(
                  onTap: () async {},
                  validator: (phone) {},
                  // controller: controller.addressController,
                  maxLength: 10,
                  borderRadius: BorderRadius.circular(
                    AppDefaults.defaultLeftRadius,
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  isPassword: false,
                  enabled: true,
                  readOnly: true,
                  autofocus: false,
                  focusBorderColor: AppColors.appDefaultColor,
                  textColor: AppColors.appDefaultColor,
                  cursorColor: AppColors.appDefaultColor,
                  filled: false,
                  hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 13,
                      ),

                  maxLines: 10,
                  minLines: 5,
                  borderWidth: 2,
                  borderColors: AppColors.appBorderColor,
                  pressablePrefix: false,
                ),
                SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.appDefaultColor.withOpacity(0.3),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormFieldWidget(
                          onTap: () async {},
                          validator: (phone) {},
                          // controller: controller.addressController,
                          maxLength: 10,
                          borderRadius: BorderRadius.circular(
                            AppDefaults.defaultLeftRadius,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.phone,
                          isPassword: false,
                          enabled: true,
                          readOnly: true,
                          autofocus: false,
                          focusBorderColor: AppColors.appWhiteColor!,
                          textColor: AppColors.appDefaultColor,
                          cursorColor: AppColors.appDefaultColor,
                          filled: false,
                          hintStyle:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 13,
                                  ),
                          hint: 'Your shop\'s photo'.tr,
                          maxLines: 10,
                          minLines: 5,
                          borderWidth: 0.2,
                          borderColors: AppColors.appWhiteColor,
                          pressablePrefix: false,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.appDefaultColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: AppSizeConfig.screenWidth > 400
                                      ? [
                                          TextSpan(
                                            text: 'Upload'.tr,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const WidgetSpan(
                                              child: SizedBox(width: 8)),
                                          const WidgetSpan(
                                            child: Icon(
                                              Icons.upload_outlined,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ]
                                      : [
                                          TextSpan(
                                            text: 'Upload'.tr,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                ),
                              ),
                              //  iconData: PhosphorIcons.googleLogo,
                              onPressed: () {},
                              // successIcon: Icons.done_outline_rounded,
                              // controller: controller.btnController,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'I agree '.tr,
                      style: Theme.of(context).textTheme.displaySmall!,
                    ),
                    Text(
                      ' Terms and Conditions '.tr,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenWidget * 2,
                ),
                DefaultButtonWidget(
                  onTap: () {
                    Get.to(() => OTPPage(
                          phoneNumber: '0788314198',
                        ));
                  },
                  height: 50,
                  radius: AppDefaults.defaultLeftRadius,
                  text: 'Send'.tr,
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
      ),
    );
  }
}
