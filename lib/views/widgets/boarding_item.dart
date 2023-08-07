import 'package:flutter/material.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_sizes.dart';
import 'package:moontak/models/boarding.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({Key? key, required this.model}) : super(key: key);

  final BoardingModel model;

  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          height: AppSizeConfig.screenHeight * 0.4,
          width: AppSizeConfig.screenHeight,
          image: AssetImage(
            model.image,
          ),
        ),
        SizedBox(
          height: AppDefaults.defaultVerticalSpaceBetweenWidget,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            model.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: AppDefaults.defaultVerticalSpaceBetweenWidget,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
