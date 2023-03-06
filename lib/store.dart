import 'dart:convert';
import 'package:flutter/services.dart';
import 'entities/beer.dart';

class Store {
  static Store instance = Store();

  Future<List<Beer>> loadBeers() async {
    List<Beer> beers = [];
    String data = await rootBundle.loadString('assets/beers.json');
    final result = jsonDecode(data.replaceAll('[[', '').replaceAll(']]', ''))
        as List<dynamic>;
    for (var beer in result) {
      Map<String, String> sections = {};
      for (var section in beer['sections']) {
        sections[section['label']] = section['value'];
      }
      beers.add(Beer(
          name: beer['name'],
          ogMin: beer['og_min'],
          ogMax: beer['og_max'],
          fgMin: beer['fg_min'],
          fgMax: beer['fg_max'],
          ibuMin: beer['ibu_min'],
          ibuMax: beer['ibu_max'],
          srmMin: beer['srm_min'],
          srmMax: beer['srm_max'],
          abvMin: beer['abv_min'],
          abvMax: beer['abv_max'],
          sections: sections));
    }
    return beers;
  }
}
