// ignore_for_file: no_leading_underscores_for_local_identifiers

class PokemonBasicEntity {
  int? count;
  String? next;
  String? previous;
  List<PokemonResultsEntity>? results;

  PokemonBasicEntity({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  PokemonBasicEntity.fromJson(Map<String, dynamic> json) {
    count = json['count'] ?? 0;
    next = json['next'] ?? '';
    previous = json['previous'] ?? '';
    results = json['results'] == null
        ? []
        : List.from(json['results']).map((e) => PokemonResultsEntity.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['next'] = next;
    _data['previous'] = previous;
    _data['previous'] = results?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PokemonResultsEntity {
  String? name;
  String? url;

  PokemonResultsEntity({
    this.name,
    this.url,
  });

  PokemonResultsEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    url = json['url'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
