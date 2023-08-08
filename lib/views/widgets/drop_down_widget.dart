import 'package:flutter/material.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';

class DropDownWidget extends StatelessWidget {
  String dropdownValue;
  List<String> items;
  IconData? icon;
  Color iconColor;
  Color borderColorWhenOpen;
  Color borderColorWhenClose;
  double borderWidth;
  FocusNode focusNode;

  final void Function(String?) onChange;

  DropDownWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.focusNode,
    required this.borderColorWhenOpen,
    required this.borderColorWhenClose,
    this.borderWidth = 2.0,
    required this.dropdownValue,
    required this.items,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      iconSize: AppDefaults.defaultIconSize - 5,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
            fontSize: 13,
          ),
      decoration: InputDecoration(
        prefixIcon: icon == null
            ? null
            : Icon(
                icon,
                color: iconColor,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDefaults.defaultLeftRadius),
          borderSide: BorderSide(
            color: borderColorWhenClose,
            width: borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDefaults.defaultLeftRadius),
          borderSide: BorderSide(
            color: borderColorWhenClose,
            width: borderWidth,
          ),
        ),
        errorStyle: TextStyle(
          color: AppColors.appErrorColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColorWhenOpen,
            width: 0.4,
          ),
          borderRadius: BorderRadius.circular(AppDefaults.defaultLeftRadius),
        ),
      ),
      value: dropdownValue,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 13,
                ),
          ),
        );
      }).toList(),
      onChanged: onChange,
      focusNode: focusNode,
    );
  }
}
