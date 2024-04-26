import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  @override
  void onInit() {
    if (kDebugMode) {
      print("Checking Auth from local storage");
    }
    super.onInit();
  }

  /// Mocks a login process
  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}