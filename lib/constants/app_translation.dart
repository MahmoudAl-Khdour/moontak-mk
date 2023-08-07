import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // Arabic
        'ar': {
          'Welcome to moontak': 'اهلاً بك في مونتك',
          'Which language do you prefer?': 'اي لغة تفضل؟',
          'Continue': 'استمرار',
        },
        // English
        'en': {},
      };
}
