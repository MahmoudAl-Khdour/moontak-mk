import 'package:get_storage/get_storage.dart';

class CacheUtils {
  final GetStorage _storage;

  CacheUtils(this._storage);

  static const _tokenKey = 'token';
  static const _userNameKey = 'userName';
  static const _emailKey = 'email';
  static const _phoneKey = 'phone';
  static const _photoUrl = 'photo';
  static const _languageKey = 'language_key';
  static const _onBoardingKey = 'onBoarding_key';

  bool isUserLoggedIn() {
    return _storage.hasData(_tokenKey);
  }

  String? getToken() {
    return _storage.read(_tokenKey);
  }

  bool? getOnBoarding() {
    return _storage.read(_onBoardingKey);
  }

  String? getLanguage() {
    return _storage.read(_languageKey);
  }

  String? getPhoto() {
    return _storage.read(_photoUrl);
  }

  String? getName() {
    return _storage.read(_userNameKey);
  }

  String? getEmail() {
    return _storage.read(_emailKey);
  }

  String? getPhone() {
    return _storage.read(_phoneKey);
  }

  Future<void> savePhoto({
    required String photo,
  }) async {
    _storage.write(_photoUrl, photo);
  }

  Future<void> saveLanguage({
    required String language,
  }) async {
    _storage.write(_languageKey, language);
  }

  Future<void> saveOnBoarding({
    required bool onBoarding,
  }) async {
    _storage.write(_onBoardingKey, onBoarding);
  }

  Future<void> signIn({
    required String token,
  }) async {
    _storage.write(_tokenKey, token);
  }

  Future<void> signOut() async {
    _storage.erase();
  }
}
