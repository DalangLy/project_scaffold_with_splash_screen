import 'package:get/get.dart';
import '../core/services/auth_service.dart';

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    if (AuthService.to.isLoggedInValue) {
      //NEVER navigate to auth screen, when user is already authed
      // return null;
      return RouteDecoder.fromRoute('/home');

      //OR redirect user to another screen
      //return RouteDecoder.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}
