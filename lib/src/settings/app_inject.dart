import 'package:get_it/get_it.dart';
import 'package:poke_app/src/core/data/services/http/http_service_imp.dart';
import 'package:poke_app/src/core/domain/services/http/http_service.dart';

class AppInject {
  static initInject() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<HttpService>(() => HttpServiceImp());
  }
}
