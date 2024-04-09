class Country {
  final String officialName;
  final String commonName;
  final String flag;
  final String region;
  final String population;

  Country({
    required this.officialName,
    required this.commonName,
    required this.flag,
    required this.region,
    required this.population,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      officialName: json['name']['official'],
      commonName: json['name']['common'],
      flag: json['flags']['png'],
      region: json['region'],
      population: json['population'].toString(),
    );
  }
}
