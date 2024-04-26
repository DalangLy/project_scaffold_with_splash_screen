import 'package:get/get.dart';

import '../core/services/auth_service.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    // you can do whatever you want here
    // but it's preferable to make this method fast
    // await Future.delayed(Duration(milliseconds: 500));

    if (!AuthService.to.isLoggedInValue) {
      const String login = '/login';
      final String afterSuccessfulLogin = route.pageSettings!.name;
      final newRoute = '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
      return RouteDecoder.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}