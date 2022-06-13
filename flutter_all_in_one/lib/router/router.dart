import 'package:auto_route/auto_route.dart';
import 'package:flutter_all_in_one/pages/viewbook.dart';
import 'package:flutter_all_in_one/router/router.gr.dart';

import '../pages/homescreen.dart';

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

    AutoRoute(page: HomeScreen, path: '/home', name: "home", initial: true),
    AutoRoute(
        page: ViewBook, path: '/viewbook:book', name: "viewbook", initial: false),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $RootRouter extends RootRouter {}
