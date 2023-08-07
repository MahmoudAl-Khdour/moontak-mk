import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moontak/constants/app_colors.dart';
import 'package:moontak/constants/app_images.dart';
import 'package:moontak/data/providers/cache_utils.dart';
import 'package:moontak/models/boarding.dart';
import 'package:moontak/views/pages/signin_page/sign_page.dart';
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

  // Boarding Contents
  List<BoardingModel> boarding = [
    BoardingModel(
      image: AppImages.placeHolder,
      title: 'Categories',
      body: 'Select the right category to find the worker you need.',
    ),
    BoardingModel(
      image: AppImages.placeHolder,
      title: 'Map',
      body:
          'Using the map, find a specific worker who is close to you. Send him a job offer and wait for a response.',
    ),
    BoardingModel(
      image: AppImages.placeHolder,
      title: 'Chat',
      body:
          'You can contact with the worker via chat to clearly convey the details.',
    ),
    BoardingModel(
      image: AppImages.placeHolder,
      title: 'privacy & Security',
      body: 'Your private information will be kept secure.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) =>
                    setState(() => isLast = index == boarding.length - 1),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: BuildBoardingItem(
                    model: boarding[index],
                  ),
                ),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SmoothPageIndicator(
                controller: boardController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                  paintStyle: PaintingStyle.fill,
                  dotHeight: 15,
                  dotWidth: 15,
                  activeDotColor: AppColors.appDefaultColor,
                )
                // SwapEffect(
                //   paintStyle: PaintingStyle.fill,
                //   type: SwapType.yRotation,
                //   dotHeight: 15,
                //   dotWidth: 15,
                //   activeDotColor: AppColors.appDefaultColor,
                // ),
                ),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
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
                      onPressed: () {
                        boardController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                      child: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    builder: (context) => FloatingActionButton(
                      onPressed: () => skip(),
                      child: AnimatedBuilder(
                        animation: buttonAnimation!,
                        builder: (context, child) => Transform.scale(
                          scale: buttonAnimation!.value,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.appDefaultColor,
                            ),
                            child: isClick
                                ? null
                                : const Icon(
                                    Icons.check_rounded,
                                    size: 30,
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
