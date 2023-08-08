import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moontak/constants/app_boarding.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_defaults.dart';
import 'package:moontak/constants/app_images.dart';
import 'package:moontak/constants/app_sizes.dart';
import 'package:moontak/data/providers/cache_utils.dart';
import 'package:moontak/views/pages/signin_page/signin_page.dart';
import 'package:moontak/views/widgets/boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  var boardController = PageController();

  bool isLast = false;
  bool isClick = false;

  AnimationController? buttonController;
  Animation<double>? buttonAnimation;

  AnimationController? skipController;
  Animation<double>? skipAnimation;

  @override
  void initState() {
    super.initState();

    buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          buttonController!.reverse();
          Get.offAll(
            const SignInPage(),
            transition: Transition.fade,
          );
        }
      });

    buttonAnimation = Tween(
      begin: 1.0,
      end: 50.0,
    ).animate(buttonController!);

    skipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          skipController!.reverse();
          Get.offAll(
            const SignInPage(),
            transition: Transition.fade,
          );
        }
      });

    skipAnimation = Tween(
      begin: 1.0,
      end: 50.0,
    ).animate(skipController!);
  }

  @override
  void dispose() {
    buttonController!.dispose();
    skipController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    AppSizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.appDefaultColor,
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.appWhiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -20),
              blurRadius: 10,
              color: AppColors.appDefaultColor,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(
              height: AppSizeConfig.screenHeight * 0.4,
              opacity: const AlwaysStoppedAnimation(.6),
              image: const AssetImage(
                AppImages.icon1,
              ),
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image(
                    width: AppSizeConfig.screenWidth,
                    opacity: const AlwaysStoppedAnimation(.6),
                    image: const AssetImage(
                      AppImages.icon2,
                    )),
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: boardController,
                        onPageChanged: (int index) => setState(() => isLast =
                            index == AppBoarding.appBoardingList.length - 1),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: BuildBoardingItem(
                            model: AppBoarding.appBoardingList[index],
                          ),
                        ),
                        itemCount: AppBoarding.appBoardingList.length,
                      ),
                    ),
                    SmoothPageIndicator(
                        controller: boardController,
                        count: AppBoarding.appBoardingList.length,
                        effect: ExpandingDotsEffect(
                          paintStyle: PaintingStyle.fill,
                          dotHeight: 10,
                          dotWidth: 10,
                          activeDotColor: AppColors.appDefaultColor,
                        )),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppDefaults.defaultLeftPadding,
                        right: AppDefaults.defaultRightPadding,
                        bottom: AppDefaults.defaultBottomPadding,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 5, 5, 0),
                            child: AnimatedBuilder(
                              animation: skipAnimation!,
                              builder: (context, child) => Transform.scale(
                                scale: skipAnimation!.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isClick
                                        ? AppColors.appDefaultColor
                                        : Colors.transparent,
                                  ),
                                  child: TextButton(
                                    onPressed: () => skip(true),
                                    child: Text(
                                      isClick ? '' : 'SKIP',
                                      style: TextStyle(
                                        color: AppColors.appDefaultColor,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          BuildCondition(
                            condition: isLast,
                            fallback: (context) => FloatingActionButton(
                              backgroundColor: AppColors.appBackgroundColor,
                              onPressed: () {
                                boardController.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: AppColors.appWhiteColor,
                              ),
                            ),
                            builder: (context) => FloatingActionButton(
                              backgroundColor: AppColors.appBackgroundColor,
                              onPressed: () => skip(),
                              child: AnimatedBuilder(
                                animation: buttonAnimation!,
                                builder: (context, child) => Transform.scale(
                                  scale: buttonAnimation!.value,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.appBackgroundColor,
                                    ),
                                    child: isClick
                                        ? null
                                        : Icon(
                                            Icons.check_rounded,
                                            size: 30,
                                            color: AppColors.appWhiteColor,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void skip([isSkip = false]) {
    setState(() => isClick = true);
    final cacheUtils = CacheUtils(GetStorage());

    cacheUtils.saveOnBoarding(onBoarding: true).then(
          (value) =>
              isSkip ? skipController!.forward() : buttonController!.forward(),
        );
  }
}
