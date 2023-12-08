import 'package:get_it/get_it.dart';

import '../core/services/http/data/http_service_imp.dart';
import '../core/services/http/domain/http_service.dart';

class AppInject {
  static initInject() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<HttpServiceInterface>(() => HttpServiceImp());
  }
}
