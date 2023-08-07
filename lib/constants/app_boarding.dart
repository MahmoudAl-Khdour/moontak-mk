import 'package:moontak/constants/app_images.dart';
import 'package:moontak/models/boarding.dart';

class AppBoarding {
  AppBoarding._();
  static List<BoardingModel> appBoardingList = <BoardingModel>[
    BoardingModel(
      image: AppImages.delivery,
      title: 'Delivery',
      body: 'Select the right category to find the worker you need.',
    ),
    BoardingModel(
      image: AppImages.delivery,
      title: 'Vision',
      body:
          'Using the map, find a specific worker who is close to you. Send him a job offer and wait for a response.',
    ),
    BoardingModel(
      image: AppImages.delivery,
      title: 'Mission',
      body:
          'You can contact with the worker via chat to clearly convey the details.',
    ),
  ];
}
