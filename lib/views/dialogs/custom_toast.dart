import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moontak/constants/app_colors.dart';

class CustomToast {
  CustomToast._();

  static final String _unAuthorizedUserMessage =
      'This action is unauthorized'.tr;
  static final String _successMessage = 'Success'.tr;
  static final String _wifiConnectionMessage = 'Check your wifi connection'.tr;
  static final String _deniedMessage = 'Permission permanent denied error'.tr;
  static final String _errorMessage = 'Something went wrong'.tr;
  static final String _requiredFieldMessage = 'Please enter required fields'.tr;
  static final String _openExternalUrlMessage =
      'An error occurred while opening an external url'.tr;

  static void requiredField() {
    Fluttertoast.showToast(
      msg: _requiredFieldMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.appErrorColor,
      textColor: AppColors.appWhiteColor,
      fontSize: 16.0,
    );
  }

  static void somethingWent() {
    Fluttertoast.showToast(
      msg: _errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.appErrorColor,
      textColor: AppColors.appWhiteColor,
      fontSize: 16.0,
    );
  }

  static void backEndError({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.appErrorColor,
      textColor: AppColors.appWhiteColor,
      fontSize: 16.0,
    );
  }

  static void success() {
    Fluttertoast.showToast(
      msg: _successMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.appSuccessColor,
      textColor: AppColors.appWhiteColor,
      fontSize: 16.0,
    );
  }

  static void unAuthorized() {
    Fluttertoast.showToast(
      msg: _unAuthorizedUserMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.appDefaultColor,
      textColor: AppColors.appWhiteColor,
      fontSize: 16.0,
    );
  }

  static void internetDisconnected() {
    Fluttertoast.showToast(
      msg: _wifiConnectionMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.appDefaultColor,
      textColor: AppColors.appWhiteColor,
      fontSize: 16.0,
    );
  }

  static void openExternalUrlError() {
    Fluttertoast.showToast(
      msg: _openExternalUrlMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.appErrorColor,
      textColor: AppColors.appWhiteColor,
      fontSize: 16.0,
    );
  }

  static void permissionPermanentDeniedError() {
    Fluttertoast.showToast(
      msg: _deniedMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.appErrorColor,
      textColor: AppColors.appWhiteColor,
      fontSize: 16.0,
    );
  }
}
