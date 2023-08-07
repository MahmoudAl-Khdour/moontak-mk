import 'package:flutter/material.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_nav.dart';
import 'package:moontak/constants/app_pages.dart';
import 'package:moontak/constants/app_sizes.dart';

/// Base Widget for main screen in nav bar
class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    AppSizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(AppDefaults.defaultRightRadius),
              topLeft: Radius.circular(AppDefaults.defaultLeftRadius),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38.withOpacity(0.22),
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDefaults.defaultLeftRadius),
              topRight: Radius.circular(AppDefaults.defaultLeftRadius),
            ),
            child: NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              selectedIndex: currentPageIndex,
              elevation: 25,
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              backgroundColor: AppColors.appWhiteColor,
              indicatorColor: AppColors.appWhiteColor,
              destinations: AppNav.appNavList,
              surfaceTintColor: AppColors.appWhiteColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppSizeConfig.screenHeight * 0.19,
                bottom: AppDefaults.defaultHorizontalSpaceBetweenWidget,
                right: AppDefaults.defaultHorizontalSpaceBetweenWidget,
                left: AppDefaults.defaultHorizontalSpaceBetweenWidget,
              ),
              child: Container(
                width: AppSizeConfig.screenWidth,
                height: (AppSizeConfig.screenHeight -
                    (AppSizeConfig.screenHeight * 0.15)),
                decoration: BoxDecoration(
                  color: AppColors.appWhiteColor,
                  borderRadius: BorderRadius.circular(
                    AppDefaults.defaultRightRadius,
                  ),
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
                ),
                child: AppPages.pageList[currentPageIndex].widget,
              ),
            ),
            //todo if have menu add if not remove it
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     vertical: AppDefaults.defaultVerticalSpaceBetweenWidget,
            //     horizontal: AppDefaults.defaultHorizontalSpaceBetweenWidget,
            //   ),
            //   child:
            //
            //   HeaderWidget(
            //     title: AppPages.pageList[currentPageIndex].pageName,
            //     onMenuTap: () {
            //
            //     },
            //     onBackTap: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
