import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Home Screen"),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: _changeTheme,
                icon: Get.isDarkMode ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _doLogout,
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogout(){
    AuthService.to.logout();
    Get.toNamed('/login');
  }

  void _changeTheme(){
    final sharedPrefs = Get.find<SharedPreferences>();
    final isDarkMode = sharedPrefs.getBool("isDarkMode") ?? Get.isDarkMode;
    Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
    sharedPrefs.setBool("isDarkMode", !isDarkMode);
  }
}
