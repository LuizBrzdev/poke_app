import '../../../../services/http/domain/http_response.dart';

abstract class FetchPokemonBasicInfoDataSource {
  Future<HttpResponse> execute();
}
