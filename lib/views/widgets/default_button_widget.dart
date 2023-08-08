import 'package:flutter/material.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_sizes.dart';

class DefaultButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final Function() onTap;
  final String text;
  final bool withIcon;
  final double textSize;
  final Color textColor;
  final bool isGoogle;
  final IconData? icon;
  final Color colorIcon;

  const DefaultButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.textSize = 13,
    this.icon,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 60,
    required this.background,
    this.isUpperCase = false,
    this.radius = 0,
    this.withIcon = false,
    this.isGoogle = false,
    this.colorIcon = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            maximumSize: Size(width, height),
            minimumSize: Size(width, height),
            backgroundColor: background,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.appBackgroundColor,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          onPressed: onTap,
          child: Text(
            maxLines: 1,
            textAlign: TextAlign.center,
            text,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: textColor,
                  fontSize: textSize,
                ),
          ),
        )),
      ),
    );
  }
}
