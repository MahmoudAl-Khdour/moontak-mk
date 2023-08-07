import 'package:flutter/material.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_sizes.dart';

class LanguageItem extends StatelessWidget {
  String countryImage;
  String languageName;
  IconData icon;
  bool activeLanguage;
  final Function() onTap;

  LanguageItem({
    super.key,
    required this.icon,
    required this.languageName,
    required this.countryImage,
    required this.activeLanguage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(countryImage),
          ),
          title: Text(
            languageName,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.appWhiteColor,
                ),
          ),
          trailing: activeLanguage
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.appWhiteColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.appDefaultColor,
                    size: 18,
                  ))
              : null,
        ),
      ),
    );
  }
}
