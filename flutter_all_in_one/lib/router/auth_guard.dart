// mock auth state

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

var isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isAuthenticated) {
      // ignore: unawaited_futures
      /* router.pushAndPopUntil(
        LoginRoute(onLoginResult: (_) {
          isAuthenticated = true;
          // we can't pop the bottom page in the navigator's stack
          // so we just remove it from our local stack
          resolver.next();
          router.removeLast();
        }),
        predicate: (r) => true,
      ); */
    } else {
      resolver.next(true);
    }
  }
}

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}