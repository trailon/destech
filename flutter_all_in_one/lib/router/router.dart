import 'package:auto_route/auto_route.dart';

import '../pages/loginscreen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // app stack
    /* AutoRoute<String>(
      path: '/',
      page: HomePage,
      // guards: [AuthGuard],
      children: [
        AutoRoute(
          path: 'books',
          page: EmptyRouterPage,
          name: 'BooksTab',
          initial: true,
          maintainState: true,
          children: [
            /* AutoRoute(
              path: '',
              page: BookListScreen,
            ),
            AutoRoute(
              path: ':id',
              page: BookDetailsPage,
              fullscreenDialog: true,
              // meta: {'hideBottomNav': true},
            ), */
          ],
        ),
        profileTab,
        AutoRoute(
          path: 'settings/:tab',
          page: SettingsPage,
          name: 'SettingsTab',
        ),
      ],
    ), */
    //userDataRoutes,
    // auth
    AutoRoute(page: LoginPage, path: '/login', name: "login", initial: true),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
