import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectorController extends GetxController {
  SectorController();

  RxString dropdownValueSectorType = RxString('Horeca');
  FocusNode sectorTypeFocusNode = FocusNode();
}
