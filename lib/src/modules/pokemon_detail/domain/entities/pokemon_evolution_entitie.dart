class PokemonEvolutionEntity {
  PokemonEvolutionEntity({
    required this.chain,
  });

  late final Chain chain;

  PokemonEvolutionEntity.fromJson(Map<String, dynamic> json) {
    chain = Chain.fromJson(json['chain']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['chain'] = chain.toJson();

    return data;
  }
}

class Chain {
  Chain({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.species,
  });
  late final List<dynamic> evolutionDetails;
  late final List<EvolvesTo> evolvesTo;

  late final Species species;

  Chain.fromJson(Map<String, dynamic> json) {
    evolutionDetails = List.castFrom<dynamic, dynamic>(json['evolution_details']);
    evolvesTo = List.from(json['evolves_to']).map((e) => EvolvesTo.fromJson(e)).toList();

    species = Species.fromJson(json['species']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['evolution_details'] = evolutionDetails;
    data['evolves_to'] = evolvesTo.map((e) => e.toJson()).toList();
    data['species'] = species.toJson();
    return data;
  }
}

class EvolvesTo {
  EvolvesTo({
    required this.evolutionDetails,
    required this.evolvesTo,
    required this.species,
  });
  late final List<EvolutionDetails> evolutionDetails;
  late final List<EvolvesTo> evolvesTo;

  late final Species species;

  EvolvesTo.fromJson(Map<String, dynamic> json) {
    evolutionDetails =
        List.from(json['evolution_details']).map((e) => EvolutionDetails.fromJson(e)).toList();
    evolvesTo = List.from(json['evolves_to']).map((e) => EvolvesTo.fromJson(e)).toList();

    species = Species.fromJson(json['species']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['evolution_details'] = evolutionDetails.map((e) => e.toJson()).toList();
    data['evolves_to'] = evolvesTo.map((e) => e.toJson()).toList();
    data['species'] = species.toJson();
    return data;
  }
}

class EvolutionDetails {
  EvolutionDetails({
    required this.minLevel,
    required this.trigger,
  });

  late final int minLevel;

  late final Trigger trigger;

  EvolutionDetails.fromJson(Map<String, dynamic> json) {
    minLevel = json['min_level'];
    trigger = Trigger.fromJson(json['trigger']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['min_level'] = minLevel;
    data['trigger'] = trigger.toJson();

    return data;
  }
}

class Trigger {
  Trigger({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Trigger.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Species {
  Species({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
