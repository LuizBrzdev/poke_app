import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_app/src/core/services/storage/data/storage_imp.dart';

import 'package:poke_app/src/settings/bindings/app_bindings.dart';
import 'package:poke_app/src/settings/app_routes.dart';
import 'package:poke_app/src/settings/app_theme.dart';
import 'package:poke_app/src/settings/bindings/features_bindings.dart';

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
  await StorageImp.instance.init();
  AppBindings.init();
  FeaturesBindings.instance.initAllDependecies();
}
