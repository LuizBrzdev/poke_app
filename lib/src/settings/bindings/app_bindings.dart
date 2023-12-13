import 'package:get_it/get_it.dart';
import 'package:poke_app/src/core/services/storage/data/storage_imp.dart';
import 'package:poke_app/src/core/services/storage/domain/storage.dart';

import '../../core/services/http/data/http_service_imp.dart';
import '../../core/services/http/domain/http_service.dart';

class AppBindings {
  static init() {
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<HttpService>(HttpServiceImp());
    getIt.registerSingleton<Storage>(StorageImp.instance);
  }
}
