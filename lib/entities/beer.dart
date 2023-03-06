class Beer {
  String name;
  double? ogMin;
  double? ogMax;
  double? fgMin;
  double? fgMax;
  double? ibuMin;
  double? ibuMax;
  double? srmMin;
  double? srmMax;
  double? abvMin;
  double? abvMax;
  Map<String, String> sections = {};

  Beer(
      {required this.name,
      required this.ogMin,
      required this.ogMax,
      required this.fgMin,
      required this.fgMax,
      required this.ibuMin,
      required this.ibuMax,
      required this.srmMin,
      required this.srmMax,
      required this.abvMin,
      required this.abvMax,
      required this.sections});

  @override
  String toString() {
    return 'Beer{name: $name, ogMin: $ogMin, ogMax: $ogMax, fgMin: $fgMin, fgMax: $fgMax, ibuMin: $ibuMin, ibuMax: $ibuMax, srmMin: $srmMin, srmMax: $srmMax, abvMin: $abvMin, abvMax: $abvMax, sections: $sections}';
  }
}
