import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../core/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
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
                  child: const Text("Login but not redirect to home screen"),
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
      ),
    );
  }
}
