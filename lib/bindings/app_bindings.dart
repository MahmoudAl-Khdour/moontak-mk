import 'package:get/get.dart';
import 'package:moontak/controllers/language_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.create(() => LanguageController());
  }
}
