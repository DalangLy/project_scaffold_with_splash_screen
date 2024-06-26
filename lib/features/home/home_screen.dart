import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final RxBool _isDarkMode = Get.isDarkMode ? true.obs : false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Home Screen"),
              const SizedBox(
                height: 10,
              ),
              ObxValue(
                (data) {
                  return IconButton(
                    onPressed: (){
                      _isDarkMode.value = !_isDarkMode.value;
                      _changeTheme();
                    },
                    icon: _isDarkMode.value ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
                  );
                },
                false.obs,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _doLogout,
                child: const Text("Logout"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: (){
                Get.offNamed('/login');
              }, child: const Text("Try goto Login Screen without logout"),),
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
    Get.changeThemeMode(Get.isDarkMode? ThemeMode.light: ThemeMode.dark);
    sharedPrefs.setBool("isDarkMode", !isDarkMode);
  }
}
