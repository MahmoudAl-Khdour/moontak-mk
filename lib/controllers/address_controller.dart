import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  AddressController();

  final addressController = TextEditingController();

  RxDouble lat = RxDouble(0.0);
  RxDouble long = RxDouble(0.0);

  Rx<GeoPoint?> notifier = Rx<GeoPoint?>(null);
  RxString address = RxString('');

  RxString dropdownValueSectorType = RxString('Horeca');
  FocusNode sectorTypeFocusNode = FocusNode();

  Future<void> getAddressFromLatLng({
    required double latitude,
    required double longitude,
  }) async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    lat.value = latitude;
    long.value = longitude;
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks[0];
        address.value =
            '${placeMark.street}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}';
        addressController.text = address.value;
      }
    } catch (e) {
      throw Exception("get Address From LatLng");
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location'.tr,
          'Location services are disabled. Please enable the services'.tr);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Location'.tr, 'Location permissions are denied'.tr);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          'Location'.tr,
          'Location permissions are permanently denied, we cannot request permissions.'
              .tr);
      return false;
    }
    return true;
  }
}
