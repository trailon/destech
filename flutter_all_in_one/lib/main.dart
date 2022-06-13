import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one/cubit/materialappcubit.dart';
import 'package:flutter_all_in_one/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if(!preferences.containsKey('favorites')){
    preferences.setStringList('favorites', []);
  }
  BlocOverrides.runZoned(
    () => runApp(const MaterialAppProvider()),
    blocObserver: AppBlocObserver(),
  );
}

class MaterialAppProvider extends StatelessWidget {
  const MaterialAppProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MaterialAppCubit(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = $RootRouter();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialAppCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          builder: EasyLoading.init(),
          routerDelegate: _appRouter.delegate(
              initialDeepLink: '/home',
              navigatorObservers: () => [AutoRouterObserver()]),
          routeInformationProvider: _appRouter.routeInfoProvider(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      },
    );
  }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      if (kDebugMode) {
        print(change);
      }
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }
}
