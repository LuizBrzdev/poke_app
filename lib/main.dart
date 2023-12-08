import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'package:poke_app/src/settings/app_inject.dart';
import 'package:poke_app/src/settings/app_routes.dart';
import 'package:poke_app/src/settings/app_theme.dart';

void main() async {
  await initOptions();

  runApp(
    MaterialApp.router(
      title: 'PokeFlutter',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.theme,
      routerDelegate: AppRoutes.appRoutes.routerDelegate,
      routeInformationParser: AppRoutes.appRoutes.routeInformationParser,
      routeInformationProvider: AppRoutes.appRoutes.routeInformationProvider,
    ),
  );
}

initOptions() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
  AppInject.initInject();
  await GetIt.I.allReady();
}
