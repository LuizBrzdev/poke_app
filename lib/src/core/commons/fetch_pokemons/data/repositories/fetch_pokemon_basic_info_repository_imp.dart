import 'package:poke_app/src/modules/home/domain/entities/pokemon_list_entity.dart';

import '../../domain/repositories/fetch_pokemon_basic_info_repository.dart';
import '../../external/datasources/fetch_pokemon_basic_info_data_source.dart';

class FetchPokemonBasicInfoRepositoryImp implements FetchPokemonBasicInfoRepository {
  final FetchPokemonBasicInfoDataSource _fetchPokemonBasicInfoDataSource;

  FetchPokemonBasicInfoRepositoryImp(this._fetchPokemonBasicInfoDataSource);

  @override
  Future<PokemonBasicEntity> execute() async {
    final response = await _fetchPokemonBasicInfoDataSource.execute();
    if (response.statusCode == 200) {
      return PokemonBasicEntity.fromJson(response.data);
    } else {
      return PokemonBasicEntity();
    }
  }
}
