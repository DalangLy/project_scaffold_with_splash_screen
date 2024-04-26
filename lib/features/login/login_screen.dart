import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthService.to.login();
                  final thenTo = context.params['then'];
                  Get.offNamed(thenTo ?? '/home');
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                  AuthService.to.login();
                },
                child: const Text("Logout but not redirect to home screen"),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  final thenTo = context.params['then'];
                  Get.offNamed(thenTo ?? '/home');
                },
                child: const Text("Goto Home Screen Directly"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
