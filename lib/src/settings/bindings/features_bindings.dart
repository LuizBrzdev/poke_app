import 'package:poke_app/src/modules/favorites/data/bindings/favorites_pokemons_bindings.dart';
import 'package:poke_app/src/modules/home/data/bindings/home_bindings.dart';
import 'package:poke_app/src/modules/pokemon_detail/data/bindings/pokemon_detail_bindings.dart';

class FeaturesBindings {
  static FeaturesBindings? _instance;

  FeaturesBindings._();
  static FeaturesBindings get instance => _instance ??= FeaturesBindings._();

  void initAllDependecies() {
    // HomeBindings.init();
    PokemonDetailBindings.init();
    FavoritesPokemonsBindings.init();
  }
}
