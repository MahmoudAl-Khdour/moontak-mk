import 'package:get/get.dart';
import 'package:moontak/controllers/address_controller.dart';
import 'package:moontak/controllers/language_controller.dart';
import 'package:moontak/controllers/sector_controller.dart';
import 'package:moontak/controllers/signin_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.create(() => LanguageController());
    Get.create(() => SignInController());
    Get.create(() => SectorController());
    Get.create(() => AddressController());
  }
}
