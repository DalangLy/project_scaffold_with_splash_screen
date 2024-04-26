import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pr/features/login/login_screen.dart';
import 'package:next_pr/middlewares/ensure_auth_middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/services/auth_service.dart';
import 'features/home/home_screen.dart';
import 'middlewares/ensure_not_authed_middleware.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // inject dependencies
  // put async
  final sharedPrefs = await SharedPreferences.getInstance();
  Get.put(sharedPrefs);

  // load theme color
  final x = Get.find<SharedPreferences>();
  final ThemeMode themeMode = x.getBool("isDarkMode") == null ? ThemeMode.system : (x.getBool("isDarkMode")! ? ThemeMode.dark : ThemeMode.light);



  //show splash screen
  runApp(
      MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("Splash Screen"),
          ),
        ),
      ),
    )
  );

  await Future.delayed(const Duration(seconds: 2));


  // disable getx log
  Get.isLogEnable = false;

  runApp(
    GetMaterialApp(
      enableLog: false,
      binds: [
        Bind.put(AuthService()),
      ],
      initialRoute: '/home',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
          middlewares: [
            EnsureNotAuthedMiddleware(),
          ],
        ),
        GetPage(
          preventDuplicates: true,
          name: '/home',
          page: () => const HomeScreen(),
          middlewares: [
            EnsureAuthMiddleware(),
          ],
        ),
      ],
    ),
  );
}