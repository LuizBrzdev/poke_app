import 'package:poke_app/src/core/commons/fetch_pokemons/external/datasources/fetch_pokemon_by_url_data_source.dart';
import 'package:poke_app/src/modules/home/domain/entities/pokemon_list_entity.dart';

import '../../domain/repositories/fetch_pokemon_by_url_repository.dart';

class FetchPokemonByUrlRepositoryImp implements FetchPokemonByUrlRepository {
  final FetchPokemonByUrlDataSource _fetchPokemonByUrlDataSource;

  FetchPokemonByUrlRepositoryImp(this._fetchPokemonByUrlDataSource);

  @override
  Future<PokemonBasicEntity> execute({required String url}) async {
    final response = await _fetchPokemonByUrlDataSource.execute(url: url);
    if (response.statusCode == 200) {
      return PokemonBasicEntity.fromJson(response.data);
    } else {
      return PokemonBasicEntity();
    }
  }
}
