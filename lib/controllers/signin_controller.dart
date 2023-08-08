import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  SignInController();

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
}
